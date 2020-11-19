import 'dart:developer';

import 'package:flutter/cupertino.dart';

class NetworkException implements Exception {
  final String _message;

  /// Describes a network error with a [message] for the user and a [logMessage]
  /// for the developers.
  NetworkException({@required String message, String logMessage})
      : _message = message,
        assert(message != null && message.isNotEmpty) {
    log(logMessage ?? message);
  }

  String get info => "Network Error, $_message";
}

class DatabaseException implements Exception {
  final String _message;

  /// Describes a database error with a [message]for the user and a [logMessage]
  /// for the developers..
  DatabaseException({@required String message, String logMessage})
      : _message = message,
        assert(message != null && message.isNotEmpty) {
    log(logMessage);
  }
  String get info => "Network Exception, $_message";
}

class DataFormat implements Exception {
  final String _message;

  /// Describes a formating error with a [message]for the user and a
  /// [logMessage] for the developers..
  DataFormat({@required String message, String logMessage})
      : _message = message,
        assert(message != null && message.isNotEmpty) {
    log(logMessage);
  }
  String get info => "Network Exception, $_message";
}
