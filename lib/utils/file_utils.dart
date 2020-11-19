import 'dart:convert';

import 'package:flutter/services.dart';

class FileUtils {
  static Future<Map<String, dynamic>> readAssetJson(String assetFile) async {
    String contents = await rootBundle.loadString(assetFile);

    var result = jsonDecode(contents) as Map;

    return result;
  }
}
