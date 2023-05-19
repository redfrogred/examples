import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Controller with ChangeNotifier {

  // (this class) variables
  static const String _fileName = 'Controller.dart'; 

    void initApp() {
      Utils.log( _fileName, 'initApp()');
      // TO_DO: use real login name below
      // TO_DO: start session (add Config.sessionStartStr, Config.sessionStartInt )
      updateDashboardMssg(headline: 'Welcome back, black.berry!',txt: 'Your last login was 3 days ago', color: Colors.green, icn: Icons.check_circle );      
    }

    // APP STUFF
    String getAppInfo() {
      return Config.appVersion;
    }

    // DASHBOARD STUFF
    void updateDashboardMssg( { String headline='', String txt='', Color color=Colors.green, IconData icn=Icons.check_circle } ) {
      if( headline == '') {
        headline = 'Logged in as "black.berry"';
        txt = 'Your last login was 3 days ago';
      }
      Config.dashboardHeadline = headline;
      Config.dashboardText = txt;
      Config.dashboardColor = color;
      Config.dashboardIcon = icn;
      notifyListeners();
    }

          String getDashboardHeadline() {
            return Config.dashboardHeadline;
          }    
          String getDashboardText() {
            return Config.dashboardText;
          }           
          Color getDashboardColor() {
            return Config.dashboardColor;
          } 
          IconData getDashboardIcon() {
            return Config.dashboardIcon;
          }           


}