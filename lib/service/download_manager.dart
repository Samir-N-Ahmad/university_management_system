import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadManger {
  static DownloadManger _instance = DownloadManger._internal();
  DownloadManger._internal();
  factory DownloadManger.instance() => _instance;

  // Download task.
  Map<String, TaskInfo> _downloadTasks = {};
  Map<String, DownloadTask> _downloadTasksFullInfo = {};

  StreamController<List<TaskInfo>> _tasksStreamController =
      StreamController<List<TaskInfo>>.broadcast();

  Stream<List<TaskInfo>> get tasksStream => _tasksStreamController.stream;
  ReceivePort _port = ReceivePort();
  String _sendPort = "SEND_PORT";

  /// Initialize service.
  Future<void> init() async {
    await Permission.storage.request();
    IsolateNameServer.registerPortWithName(_port.sendPort, _sendPort);
    _port.listen((dynamic data) {
      TaskInfo downloadTaskProgress = TaskInfo.fromList(data);
      _downloadTasks[downloadTaskProgress.id] = downloadTaskProgress;
      _tasksStreamController.sink.add(_downloadTasks.values.toList());
    });
    await FlutterDownloader.initialize(
      debug: true,
    );
    FlutterDownloader.registerCallback(_downloadCallback);
    await loadFiles();
  }

  /// Load previous tasks.
  Future<void> loadFiles() async {
    (await FlutterDownloader.loadTasks()).map((e) {
      _downloadTasks[e.taskId] =
          TaskInfo(id: e.taskId, progress: e.progress, status: e.status);
      _downloadTasks[e.taskId]?.task = e;
    });
    _tasksStreamController.sink.add(_downloadTasks.values.toList());
  }

  /// Download a file using the given [url] with the given [key].
  Future<void> download({String url, String key}) async {
    if (key == null) {
      await _newTask(url);
    } else {
      if (_downloadTasks.containsKey(key)) {
        await _existingTask(_downloadTasks[key]);
      }
    }
  }

  /// High-level method to connect Main isolate with worker isolate that
  /// downloads files.
  /// Helps to
  static void _downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('SEND_PORT');
    send.send([id, status, progress]);
  }

  /// Handle task due to its current status.
  Future<void> _existingTask(TaskInfo task) async {
    switch (task.status.value) {
      // running
      case 2:
        {
          FlutterDownloader.pause(taskId: task.id);
          break;
        }
      // Completed
      case 3:
        {
          FlutterDownloader.open(taskId: task.id);
          break;
        }
      // Paused
      case 6:
        {
          FlutterDownloader.resume(taskId: task.id);
          break;
        }
      // Retry tasks by default.
      default:
        {
          FlutterDownloader.retry(taskId: task.id);
        }
    }
  }

  /// Create a new task.
  Future<void> _newTask(String url) async {
    String directory = await FilePicker.platform.getDirectoryPath();
    if (directory != null && directory != "") {
      String id = await FlutterDownloader.enqueue(
          headers: {"auth": "test_for_sql_encoding"},
          url: url,
          savedDir: directory,
          openFileFromNotification: true);
      if (id != "" && id != null) {
        DownloadTask task = await getTask(id);
        if (task != null) {
          _downloadTasksFullInfo[id] = task;
          _downloadTasks[id]?.task = task;
        }
      }
    }
  }

  /// Get the task with [id]
  Future<DownloadTask> getTask(String id) async {
    assert(id != null);
    if (_downloadTasksFullInfo.containsKey(id)) {
      return _downloadTasksFullInfo[id];
    }
    var tasks = await FlutterDownloader.loadTasksWithRawQuery(
        query: "SELECT * FROM task WHERE id=$id");
    if (tasks != null && tasks.isEmpty) {
      _downloadTasksFullInfo[id] = tasks[0];
      return tasks[0];
    }
    return null;
  }

  /// Closes streams.
  void dispose() {
    _tasksStreamController.close();
    IsolateNameServer.removePortNameMapping(_sendPort);
  }
}

/// Basic info needed for the UI to be shred over isolates.
class TaskInfo with ChangeNotifier {
  int progress;
  DownloadTaskStatus status;
  String id;
  DownloadTask task;

  void update(DownloadTaskStatus status, String id) {
    status = status;
    id = id;
    notifyListeners();
  }

  TaskInfo.fromList(List<dynamic> data)
      : id = data[0],
        status = data[1],
        progress = data[2];

  TaskInfo({this.id, this.progress, this.status});
}
