import 'package:flutter/cupertino.dart';
import 'package:university_management_system/common/settings.dart'
    as app_settings;

class Data<T> {
  T _data;
  app_settings.DataStatus _status;
  String _message = "";
  int _page = 0;
  int _totalResults = 0;
  int _totalPages = 0;
  bool _hasData = false;
  bool _hasNext = false;
  bool _hasPrevious = false;
  Data({
    @required T data,
    @required app_settings.DataStatus status,
    @required String message,
    int page = 0,
    int totalPages = 0,
    int totalResults = 0,
  })  : _data = data,
        _status = status,
        _message = message,
        _page = page,
        _totalResults = totalResults,
        _totalPages = totalPages {
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  Data.copy(Data t) {
    _data = t.data;
    _status = t.status;
    _message = t.message;
    _page = t.page;
    _totalPages = t.totalPages;
    _totalResults = t.totalResults;
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  Data.copyProperties(Data t) {
    _status = t.status;
    _message = t.message;
    _page = t.page;
    _totalPages = t.totalPages;
    _totalResults = t.totalResults;
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  Data.faild({T previousData, @required String message}) {
    _data = previousData;
    _status = app_settings.DataStatus.faild;
    _message = message;
  }

  Data.succeed(
      {@required T data,
      String message,
      int page = 0,
      int totalPages = 0,
      int totalResults = 0}) {
    _data = data;
    _status = app_settings.DataStatus.succeed;
    _message = message;
    _page = page;
    _totalPages = totalPages;
    _totalResults = totalResults;
    _hasData = _data != null;
    _hasNext = page < totalPages;
    _hasPrevious = page > 1;
  }

  Data.inProgress({
    String message,
    T initialData,
  }) {
    _hasData = initialData == null ? false : true;
    _data = initialData;
    _status = app_settings.DataStatus.inProgress;
    _message = message;
  }

  Data.withData({
    @required T data,
  }) {
    _hasData = data == null ? false : true;
    _data = data;
    _status = app_settings.DataStatus.inProgress;
    _message = message;
  }

  Data.empty({
    T initialData,
  }) {
    _data = initialData;
    _hasData = initialData == null ? false : true;
    _status = app_settings.DataStatus.none;
  }

  void copyProperties(Data t) {
    _status = t.status;
    _message = t.message;
    _page = t.page;
    _totalPages = t.totalPages;
    _totalResults = t.totalResults;
    _hasData = _data != null;
    _hasNext = _page < totalPages;
    _hasPrevious = _page > 1;
  }

  set data(data) {
    _hasData = data == null ? false : true;
    _data = data;
  }

  set status(s) => _status = s;

  set message(message) => _message = message;

  set page(page) {
    _page = page;
    _hasNext = _page < _totalPages;
  }

  set totalPages(totalPages) {
    _totalPages = totalPages;
  }

  set totalResults(totalResults) {
    _totalResults = totalResults;
  }

  T get data => _data;

  app_settings.DataStatus get status => _status;
  String get message => _message;

  int get page => _page;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;

  bool get hasNext => _hasNext;
  bool get hasPrevious => _hasPrevious;
  bool get hasData => _hasData;
}
