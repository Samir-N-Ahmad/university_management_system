import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;

typedef OnPressed = void Function();

class MainSectionWidget extends StatelessWidget {
  final String _icon;
  final String _text;
  final OnPressed _onPressed;

  MainSectionWidget(
      {@required String iconAsset,
      @required String title,
      @required OnPressed onPressed})
      : _icon = iconAsset,
        _text = title,
        _onPressed = onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _onPressed,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: SvgPicture.asset(
                    _icon,
                    fit: BoxFit.contain,
                  )),
              Expanded(
                  child: Text(
                _text,
                style: app_settings.TextStyles.TEXT_SMALL_BOLD_DARK,
              ))
            ],
          ),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Color(0x77B2B2B2), blurRadius: 10, spreadRadius: 3)
          ]),
        ));
  }
}
