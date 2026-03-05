import 'package:colorize/colorize.dart';
import 'package:flutter/cupertino.dart';

class Dev {
  static const bool _isLoggerEnable = true;
  Dev._();
  static void logValue(dynamic value) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("The value is : ******  $value  ******")
          .magenta()
          .red()
          .bold()
          .italic()
          .initial,
    );
  }

  static void logError(dynamic value) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("The Error is : ******  $value  ******")
          .bgRed()
          .black()
          .bold()
          .italic()
          .initial,
    );
  }

  static void logLine(dynamic value) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("******(  $value  )******")
          .bgGreen()
          .black()
          .bold()
          
          .italic()
          .initial,
    );
  }

  static void logSuccess(dynamic value) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("--------   Success with : $value   --------")
          .bgCyan()
          .black()
          .bold()
          .italic()
          .initial,
    );
  }

  static void logFaild(dynamic value, dynamic reason) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("++++++++   Faild with : $value  ||| Reason: $reason ++++++++")
          .bgRed()
          .black()
          .bold()
          .italic()
          .initial,
    );
  }

  static void logList(List items, {String listName = 'Default'}) {
    if (!_isLoggerEnable) return;
    logLine('List with name $listName and  size is ${items.length}');
    for (int i = 0; i < items.length; i++) {
      debugPrint(
        Colorize("******  Item with index $i ===> ${items[i]}  ******")
            .bgLightGray()
            .black()
            .bold()
            .italic()
            .initial,
      );
    }
  }

  static void logLineWithTag({dynamic tag, dynamic message}) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("******  $tag: $message  ******")
          .bgWhite()
          .black()
          .bold()
          .initial,
    );
  }

  static void logLineWithTagError({
    dynamic tag,
    dynamic message,
    dynamic error,
  }) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("******  $tag: $message >>>>> Error => $error  ******")
          .bgLightRed()
          .black()
          .bold()
          .initial,
    );
  }

  static void logDivider({dynamic symbole = '*', dynamic length = 20}) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("$symbole" * length).bgDarkGray().yellow().bold().initial,
    );
  }

  static void logWithLine({dynamic title}) {
    if (!_isLoggerEnable) return;
    debugPrint(
      Colorize("*" * 25).bgYellow().black().bold().initial +
          Colorize("$title").bgBlack().white().bold().initial +
          Colorize("*" * 25).bgYellow().black().bold().initial,
    );
  }

  static void logMap(Map<dynamic, dynamic> map) {
    if (!_isLoggerEnable) return;

    logLine('Map contains ${map.length} entries:');
    map.forEach((key, value) {
      debugPrint(
        Colorize("Key: $key").bgBlue().white().bold().initial +
            Colorize(" => Value: $value").bgYellow().black().bold().initial,
      );
    });
  }

  static void logMapWithTag({
    String? tag,
    String? message,
    Map<dynamic, dynamic>? map,
  }) {
    if (!_isLoggerEnable) return;

    logLine('Map contains ${map!.length} entries:');
    map.forEach((key, value) {
      debugPrint(
        Colorize("******  $tag: ").bgYellow().black().bold().initial +
            (message != null
                ? Colorize(" $message  ******").bgBlue().black().bold().initial
                : '') +
            Colorize("Key: $key").bgBlue().white().bold().initial +
            Colorize(" => Value: $value").bgYellow().black().bold().initial,
      );
    });
  }
}
