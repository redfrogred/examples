# FMApp_Flutter (version 1.0.alpha.17)
This repo is the 2023 version of the Fluid Mobile App

## DESCRIPTION
The goal is to launch with a subset of the overall goals. (You know, like all agile-like.) Goals are: Devices, Workflow, Logout.

## LEFT OFF
* cleaned code for repo

## NEXT STEPS 
  * make session vars (start, length)
    + requires Date class

## FUTURE
  * make Message Alerts

## DONE
  * tidied code
  * added Dashboard Messaging
  * get dialog showing up when blanks
  * get highlight on web side
  * add Debug page
    + with log, too

## REMEMBER
* To get webvie working:
    + in pubspec.yaml
    + add webview_flutter: ^3.0.4
    
    + then, in: android/app/build.gradle
    + add: android { compileSdkVersion 32 }
    + then, in same file
    + make: minSdkVersion 30 // flutter.minSdkVersion
    +       targetSdkVersion 30 //flutter.targetSdkVersion

    + then, in android/app/src/main/AndroidManifest.xml
    + make: <uses-permission android:name="android.permission.INTERNET"/>   

