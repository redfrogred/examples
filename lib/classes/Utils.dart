// ignore_for_file: file_names
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import './Config.dart';

class Utils {

  // (this class) variables
  static const String _fileName = 'Utils.dart'; 
  static String _lastFileName = '';
  static int _stampCount = 1;
  static String str = '';

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

  static String friendlyTimeDiff () {
    int diff = timeStamp() - getBeginTimeStamp();
    double minute = 0;
    if ( diff < 60000 ) {
      double seconds = diff * .001;
      return seconds.toStringAsFixed(1) +'s';
    }
    else {
      minute = diff/60000;
      double remainder = diff%60000;
      remainder = remainder*.001;
      return '<span class="tiny">' + (minute.toInt()).toString() + 'm</span><br />' + remainder.toStringAsFixed(1) +'s';
    }
    
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
      // if the calling filename has changed, highlight it in blue
      if ( filename == _lastFileName ) {
        str = '<b>$filename</b>';
      }
      else {
        str = '<b class="blue">$filename</b>';
      }
      _lastFileName = filename;
      
      Config.log += '<tr class="timestamp"><td class="yellow" rowspan="2">${ friendlyTimeDiff() }</td><td><b>$str</b></span></td></tr><tr class="description"><td class="ltgrey">$message</td></tr>';

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
    Utils.log( _fileName,'clearLog()' );
  }

  static void stampLog() {
    DateTime date = DateTime.now();
    var formatter = DateFormat('E MMM dd @ HH:mm a');
    //Thur May 22 @ 11:41AM
    Config.log += '<tr><td colspan="2"><hr /><b>(${ _stampCount.toString() }) ${ formatter.format(date).toString() }</b><hr style="margin-bottom: .5em;"/></td></tr>';
    _stampCount++; 
    // don't show loggin of stamp
    //Utils.log( _fileName,'stampLog()' );
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