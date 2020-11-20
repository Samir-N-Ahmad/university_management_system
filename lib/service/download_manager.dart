import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadManger {
  static DownloadManger _instance = DownloadManger._internal();
  DownloadManger._internal();
  factory DownloadManger.instance() => _instance;

  Future<void> init() async {
    await FlutterDownloader.initialize(debug: true);
  }
}
