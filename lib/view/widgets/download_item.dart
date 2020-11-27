import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;
import 'package:university_management_system/service/download_manager.dart';

typedef OnClick = void Function();

class DownloadItem extends StatelessWidget {
  final TaskInfo _taskInfo;
  final OnClick _onClick;

  DownloadItem(
      {@required OnClick onClick, TaskInfo taskInfo, bool downloading = false})
      : _taskInfo = taskInfo,
        _onClick = onClick;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _onClick,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: app_settings.DefaultAppColorTHeme
                                        .COLOR_BG_SECONDARY),
                                child: SvgPicture.asset(
                                  "assets/icons/file.svg",
                                ))),
                        Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _taskInfo.task.filename,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: app_settings
                                      .TextStyles.TEXT_SMALL_MEDIUM_DARK,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        app_settings
                                                .Settings.DOWNLOAD_TASK_STATUS[
                                            _taskInfo.status.value],
                                        overflow: TextOverflow.ellipsis,
                                        style: app_settings
                                            .TextStyles.TEXT_SMALL_REGULAR_GREY,
                                      ),
                                    ),
                                    Expanded(
                                        child: Text("${_taskInfo.progress}%")),
                                  ],
                                )
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // color:
                                //     app_settings.DefaultAppColorTHeme.COLOR_BG_SECONDARY
                              ),
                              child: Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        DownloadManger.instance()
                                            .download(key: _taskInfo.id);
                                      },
                                      child:
                                          _downloadItemStatusBuilder(context))),
                            ))
                      ],
                    )),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Color(0XFFEEEEEE),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(5)),
                      ),
                    ),
                    ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(5)),
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          value: _taskInfo.progress.toDouble() / 100,
                          backgroundColor: Color(0XFFEEEEEE),
                          valueColor: AlwaysStoppedAnimation(
                              _taskInfo.status.value == 4 ||
                                      _taskInfo.status.value == 5
                                  ? Color(0XFF3FD1FF).withRed(200)
                                  : _taskInfo.status.value == 6
                                      ? Color(0X553FD1FF)
                                      : Color(0XFF3FD1FF)),
                        ))
                  ],
                )
              ]),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: Color(0x77B2B2B2), blurRadius: 10, spreadRadius: 3)
              ]),
        ),
      );

  // Builds the action's icon for the download's current state.
  Widget _downloadItemStatusBuilder(BuildContext context) {
    Widget icon = Container();
    switch (_taskInfo.status.value) {
      // running
      case 2:
        {
          icon = Icon(
            Icons.pause,
          );
          break;
        }
      // Completed
      case 3:
        {
          icon = Icon(
            Icons.open_in_new_rounded,
            color: app_settings.DefaultAppColorTHeme.COLOR_BG_PRIMARY,
          );
          break;
        }
      // Paused
      case 6:
        {
          icon = Icon(
            Icons.play_arrow,
            color: app_settings.DefaultAppColorTHeme.COLOR_BG_PRIMARY,
          );
          break;
        }
      // Retry tasks by default.
      default:
        {
          icon = Icon(
            Icons.replay_circle_filled,
            color: Colors.red[500],
          );
        }
    }
    return icon;
  }
}
