// ignore_for_file: file_names

import 'package:examples/classes/AlertItem.dart';
import 'package:flutter/material.dart';

class Config {
  
  static const  String    appName                = "examples";
  static const  String    appVersion             = "1.0.alpha.4";
  static String           log                    = "";           //  keep a log of what is sent to console
  
  static bool             appDebugActive         = true;         //  should debugging features be shown? 
  static bool             appInitialized         = false;        //  after StartPage loaded, it is init'ed
  
  // delays
  static int              shortDelay              = 500; // milliseconds
  static int              longDelay               = 1500; // milliseconds

  // global "CSS" styles
  static Color            mainBackgroundColor     = const Color(0xFF1A1A1A);
  static Color            mainFontColor           = Colors.white;
  static const double     mainFontSize            = 16;
  static Color            buttonBackgroundColor   = Colors.cyan.shade400;
  static Color            accent1Color            = Colors.grey;
  static Color            accent2Color            = const Color(0xFF333333);

  // global "status" colors (for errors, warning, etc.)
  static List<Color> statusColor = [
    Colors.white,
    Colors.green,
    Colors.orange,
    Colors.red,
  ];


static List<String>     alertMssg               = [];

  static final List<AlertItem> alertItems = [
    AlertItem(
      title: 'FORM SUBMISSION ERROR',
      description: 'A form could not be submitted. This is usually caused due to a connectivity issue.',
      alertLevel: 1,
      alertType: 1,
      alertAction: 'do_something!',
      details: 'TIMEL 12:19 pm\nFORM: Dark Matter Form',      
    ), 
  ];
  

}