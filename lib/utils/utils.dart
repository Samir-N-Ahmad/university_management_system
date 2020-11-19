import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management_system/model/data.dart';
import 'package:university_management_system/view/widgets/error_placeholder.dart';

typedef OnLoading = Widget Function(BuildContext, Data);
typedef OnError = Widget Function(BuildContext, Data);
typedef OnSuccess = Widget Function(BuildContext, Data);

class Utils {
  static Future<dynamic> showCustomDialog(
    BuildContext context, {
    Widget content,
    Widget title,
    bool dimissable = true,
    List<Widget> actions,
    Color color,
  }) async {
    var returnedValue = await showDialog(
        barrierDismissible: dimissable,
        context: context,
        child: AlertDialog(
            backgroundColor: color,
            title: title,
            content: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                content,
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Wrap(
                  children: actions,
                  direction: Axis.horizontal,
                  spacing: MediaQuery.of(context).size.width * 0.02,
                  alignment: WrapAlignment.spaceBetween,
                )
              ],
            ))));

    return returnedValue;
  }

  static bool isNullOrEmpty(dynamic o) => o == null || (o is String)
      ? o == ""
      : false || (o is Map)
          ? (o as Map).length == 0
          : false || (o is List)
              ? (o as List).length == 0
              : false;

  static Future<dynamic> showIrremovableErrorMessage(
    BuildContext context, {
    List<Widget> actions,
    String message,
    Color color,
  }) async {
    var value = await Utils.showCustomDialog(
      context,
      dimissable: false,
      actions: actions,
      content: WillPopScope(child: Text(message), onWillPop: () async => false),
    );
    return value;
  }

  static Widget requestHandler(BuildContext context, Data data,
      {OnLoading onLoading,
      OnError onError,
      OnSuccess onSuccess,
      Widget child}) {
    Widget result;
    switch (data.status) {
      case app_settings.DataStatus.faild:
        {
          result = onError(context, data) ??
              ErrorPlaceholder(
                text: data.message,
              );
          break;
        }
      case app_settings.DataStatus.succeed:
        {
          result = onSuccess(context, data);
          break;
        }
      case app_settings.DataStatus.none:
        {
          result = ErrorPlaceholder(
            text: "No Data Found.",
          );
          break;
        }
      case app_settings.DataStatus.inProgress:
        {
          result = onLoading(context, data) ??
              Center(
                child: SizedBox(
                    child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(
                      app_settings.DefaultAppColorTHeme.COLOR_BG_PRIMARY),
                )),
              );
          break;
        }
      default:
        {
          result = child ??
              ErrorPlaceholder(
                text: data.message,
              );
        }
    }
    return result;
  }
}
