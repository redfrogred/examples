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
    return diffNum.toStringAsFixed(1);
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
      //Config.log += '-----------';
    }

    // print the message
      if (kDebugMode) {
        print('(${ timeDiff() }) >> ($filename) $message');
      }
      Config.log += '<tr class="timestamp"><td class="yellow">${ timeDiff() }</td><td><b>$filename</b></span></td></tr><tr class="description"><td></td><td class="ltgrey">$message</td></tr>';

    // show highlighted?
    if ( highlight == true ) {
      if (kDebugMode) {
        print('====================================================');
      }
      //Config.log += '-----------';
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