import 'package:flutter/material.dart';

class NavProvider with ChangeNotifier {
  int _currentIndex = 0; // 현재 선택된 인덱스
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // 변경 사항을 UI에 반영
  }
}
