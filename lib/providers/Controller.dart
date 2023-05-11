import 'package:flutter/material.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';

class Controller with ChangeNotifier {

    // POPS
    void incrementPop() {
      Config.pops++;
      notifyListeners();
    }

    String getAppInfo() {
      return Config.appVersion;
    }

}