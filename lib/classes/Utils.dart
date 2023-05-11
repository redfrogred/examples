// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import './Config.dart';

class Utils {

  // timestamp stuff
  static int beginTimeStamp = DateTime.now().millisecondsSinceEpoch;

  static int getBeginTimeStamp() {
    return beginTimeStamp;
  }

  static int timeStamp () {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String timeDiff () {
    int diff = timeStamp() - getBeginTimeStamp();
    double diffNum = 0;
    if (diff < 0) {
      diffNum = 0;
    }
    else {
      diffNum = diff * .001;
    }
    return diffNum.toStringAsFixed(1) + ' sec';
  }

  //  return a simplified version of Config.appVersion
  //  Example: "1.0.a.003" becomes "1.0"
  static String getSimpleVersion () {
    final splitted = Config.appVersion.split('.');
    // return splitted[0] + '.' + splitted[1];
    return Config.appVersion;
  }


  static void log( String filename, String message, [ int num = 1 ]) {

    bool highlight = false;

    if ( num == 0 ) {
      highlight = true;
      num = 1;
    }

    // show highlighted?
    if ( highlight == true ) {
      if (kDebugMode) {
        print('====================================================');
      }
      // Config.log += '<tr><td colspan="2"><hr /></td?</tr>';
    }

    // print the message
      if (kDebugMode) {
        print('(${ timeDiff() }) >> ($filename) $message');
      }
      // Config.log += '<tr><td class="nowrap">(${ timeDiff() })</td><td>$message</td></tr>';

    // show highlighted?
    if ( highlight == true ) {
      if (kDebugMode) {
        print('====================================================');
      }
      // Config.log += '<tr><td colspan="2"><hr /></td?</tr>';
    }


  }

  static void clearLog() {
    Config.log = '';
  }

  //  The "truncateStr" accepts 3 parameters:
  //    1 - the String to be chopped
  //    2 - where to chop it (int)
  //    3 - an optional cutOffStr (defaults to "...")

  static String truncateStr ( String str, int passedCutOff, [ cutOffStr = '...' ] ) {
    int cutOff = passedCutOff + 3;
    String newStr = str;
    if ( str.length > cutOff ) {
      newStr = '${str.substring(0, cutOff)}$cutOffStr';
    }
    return newStr;
  }  

}