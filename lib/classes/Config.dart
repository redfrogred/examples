// ignore_for_file: file_names

import 'package:examples/classes/ListItem.dart';
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
  static double           mainFontSize            = 16;
  static Color            buttonBackgroundColor   = Colors.cyan.shade400;

  static final List<ListItem> listItems = [
    ListItem(
      title: 'Milk',
      description: 'dairy product',
    ),
    ListItem(
      title: 'Eggs',
      description: 'dairy product',
    ),
    ListItem(
      title: 'Chocolate',
      description: 'sweet treat',
    ),        
    ListItem(
      title: 'Paper Towels (that are extra long to see if the dang thing wraps?)',
      description: 'household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household. household items are used for the household.',
    ),
    ListItem(
      title: 'bra',
      description: 'tata-related',
    ),     
  ];
  

}