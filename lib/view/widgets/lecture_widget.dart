import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;

typedef OnDownload = void Function();

class LectureWidget extends StatelessWidget {
  final String _lecture;
  final OnDownload _onDownload;

  LectureWidget({@required OnDownload onDownload, @required String title})
      : _lecture = title,
        _onDownload = onDownload;
  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: _onDownload,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: app_settings
                            .DefaultAppColorTHeme.COLOR_BG_SECONDARY),
                    child: SvgPicture.asset(
                      "assets/icons/file.svg",
                      width: 25,
                    ))),
            Expanded(
                child: Text(
              _lecture,
              style: app_settings.TextStyles.TEXT_SMALL_BOLD_DARK,
            )),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "80% Downloading",
                      style:
                          app_settings.TextStyles.TEXT_EXTRA_SMALL_REGULAR_DARK,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Color(0XFFEEEEEE),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(5)),
                          ),
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(5)),
                            child: LinearProgressIndicator(
                              minHeight: 6,
                              value: 0.6,
                              backgroundColor: Color(0XFFEEEEEE),
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0XFF3FD1FF)),
                            ))
                      ],
                    )
                  ],
                ))
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Color(0x77B2B2B2), blurRadius: 10, spreadRadius: 3)
            ]),
      ));
}
