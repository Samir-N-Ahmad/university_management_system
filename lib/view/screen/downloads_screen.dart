import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;
import 'package:university_management_system/service/download_manager.dart';
import 'package:university_management_system/utils/utils.dart';
import 'package:university_management_system/view/widgets/download_item.dart';

class DownloadsSCreen extends StatefulWidget {
  _DownloadsSCreenState createState() => _DownloadsSCreenState();
}

class _DownloadsSCreenState extends State<DownloadsSCreen> {
  TextEditingController _urlEditingController;
  DownloadManger _downloadManager;
  @override
  void initState() {
    _urlEditingController = TextEditingController();
    _downloadManager = DownloadManger.instance();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            Utils.showCustomDialog(context,
                title: Text(
                  "New Download",
                  style: app_settings.TextStyles.TEXT_MEDIUM_BOLD_DARK,
                ),
                content: TextField(
                  controller: _urlEditingController,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (!Utils.isNullOrEmpty(_urlEditingController.text)) {
                          DownloadManger.instance()
                              .download(url: _urlEditingController.text);
                        }
                      },
                      child: Text("Add")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"))
                ]);
          },
        ),
      ),
      body: NestedScrollView(
          reverse: false,
          headerSliverBuilder: (context, innerBoxScrolled) => [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  centerTitle: true,
                  title: Text(
                    "Downloads",
                    style: app_settings.TextStyles.TEXT_LARGE_BOLD_DARK,
                  ),
                ),
              ],
          body: Center(
            child: StreamBuilder<List<TaskInfo>>(
                stream: _downloadManager.tasksStream,
                builder: (context, snapshot) {
                  return Container(
                      child: snapshot.hasData
                          ? snapshot.data != null
                              ? ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemExtent: 80,
                                  padding: EdgeInsets.all(10),
                                  itemBuilder: (context, index) => DownloadItem(
                                    onClick: () {},
                                    taskInfo: snapshot.data[index],
                                  ),
                                )
                              : Text("No Data")
                          : Text("No Data"));
                }),
          )),
    );
  }
}
