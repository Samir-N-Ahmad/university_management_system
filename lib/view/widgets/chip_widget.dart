import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;

typedef OnPress = void Function();

class ChipWidget extends StatelessWidget {
  final String _label;
  final OnPress _onPress;
  final IconData _icon;

  ChipWidget(
      {@required OnPress onPress,
      @required String label,
      @required IconData icon})
      : _icon = icon,
        _label = label,
        _onPress = onPress;
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: app_settings.DefaultAppColorTHeme.COLOR_BG_SECONDARY,
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width)),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _onPress,
              child: Icon(_icon),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              _label,
              style: app_settings.TextStyles.TEXT_EXTRA_SMALL_REGULAR_DARK,
            ),
          ],
        ),
      );
}
