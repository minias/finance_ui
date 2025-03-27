import 'package:flutter/material.dart';

class NoticeProvider extends ChangeNotifier {
  String _notice = '';

  String get notice => _notice;

  void updateNotice(String newNotice) {
    _notice = newNotice;
    notifyListeners();
  }

  void clearNotice() {
    _notice = ''; // ✅ 공지 초기화
    notifyListeners();
  }
}
