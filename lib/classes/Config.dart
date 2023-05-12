// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Config {
  
  static const  String  appName                   = "examples";
  static const  String  appVersion                = "1.0.alpha.2";
  static String         log                       = "";           //  keep a log of what is sent to console
  
  static bool           appDebugActive            = true;         //  should debugging features be shown? 
  static bool           appInitialized            = false;        //  after StartPage loaded, it is init'ed
  
  static int            pops                      = 0;            // *** REMOVE LATER ***

  //static String         currentFormName           = "Dark Matter Form";           // name of Form Template
  //static String         currentFormKey            = "1f0247f7-4ba7-4c66-b2f1-4ba01545d97e";           // key of Form Template
  static String         currentFormName           = "";           // name of Form Template
  static String         currentFormKey            = "";           // key of Form Template

  static String         currentFormSpecificKey    = "";           // key of a particular Filled Out form
}