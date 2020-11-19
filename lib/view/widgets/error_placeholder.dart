import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;

typedef OnRetry = void Function();

class ErrorPlaceholder extends StatelessWidget {
  final OnRetry onRetry;
  final String text;
  final String image;

  ErrorPlaceholder({this.text, this.onRetry, this.image});
  @override
  Widget build(BuildContext context) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          image == null
              ? Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red,
                )
              : SvgPicture.asset(
                  image,
                  color: Colors.grey,
                  width: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? MediaQuery.of(context).size.width * 0.1
                      : MediaQuery.of(context).size.width * 0.3,
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "$text",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: app_settings.DefaultAppColorTHeme.COLOR_FONT_DARK
                    .withOpacity(0.9),
                fontSize: app_settings.FontSizes.SMALL),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          onRetry != null
              ? GestureDetector(
                  onTap: onRetry,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "RETRY",
                      style: TextStyle(
                          color:
                              app_settings.DefaultAppColorTHeme.COLOR_FONT_DARK,
                          fontWeight: FontWeight.w300,
                          fontSize: app_settings.FontSizes.SMALL),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            app_settings.Settings.BORDER_RADIUS_SMALL),
                        border: Border.all(
                            width: 2,
                            color: app_settings
                                .DefaultAppColorTHeme.COLOR_BG_PRIMARY
                                .withRed(250))),
                  ),
                )
              : Container()
        ],
      ));
}
