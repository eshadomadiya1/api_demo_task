import 'package:flutter/cupertino.dart';

abstract class LogUtils {
  static const String _colorCode = '\x1B[';
  static const String _defaultColorCode = '${_colorCode}0m';

  static void errorLog(String message) => _log(message, 160);

  static void successLog(String message) => _log(message, 2);

  static void debugLog(String message) => _log(message, 208);

  static void _log(String message, int code) => debugPrint('${_colorCode}38;5;${code}m$message$_defaultColorCode');
}
