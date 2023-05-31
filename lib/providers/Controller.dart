import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Controller with ChangeNotifier {

  // (this class) variables
  static const String _fileName = 'Controller.dart'; 

    void initApp() {
      Utils.log( _fileName, 'initApp()');
    }

    // APP STUFF
    String getAppInfo() {
      return Config.appVersion;
    }

    String getAlertsNumberStr () {
      if ( Config.alertMssg.length == 1 ) {
        return 'You have 1 alert';
      }
      else {
        return 'You have ${ Config.alertMssg.length.toString() } alerts';
      }          
    }

}