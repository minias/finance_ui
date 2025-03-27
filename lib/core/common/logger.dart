// lib/core/common/logger.dart
import 'package:flutter/foundation.dart';

class Logger {
  static void log(String message) {
    // iOS, Android 모두에서 동작하는 로깅 처리
    if (kDebugMode) {
      print('[FinanceUI LOG]: $message');
    }
  }
}
