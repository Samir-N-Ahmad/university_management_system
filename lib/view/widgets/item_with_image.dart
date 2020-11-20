import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;
import 'package:university_management_system/utils/utils.dart';

typedef OnClick = void Function();

class ItetmWithImage extends StatelessWidget {
  final String _title;
  final String _body;
  final OnClick _onClick;
  final String _image;

  ItetmWithImage(
      {@required OnClick onClick,
      @required String title,
      String body,
      String image})
      : _title = title,
        _body = body,
        _image = image,
        _onClick = onClick;
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Color(0x77B2B2B2), blurRadius: 10, spreadRadius: 3)
            ],
            color: app_settings.DefaultAppColorTHeme.COLOR_BG_MAIN),
        child: ListTile(
          title: Text(
            _title,
            style: app_settings.TextStyles.TEXT_MEDIUM_MEDIUM_DARK,
          ),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              _body,
              style: app_settings.TextStyles.TEXT_SMALL_REGULAR_GREY,
            ),
            SizedBox(
              height: 20,
            ),
            Utils.isNullOrEmpty(_image)
                ? Container()
                : Container(
                    height: 100,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_image), fit: BoxFit.contain),
                        shape: BoxShape.rectangle,
                        color: app_settings
                            .DefaultAppColorTHeme.COLOR_BG_SECONDARY),
                  )
          ]),
        ),
      );
}
