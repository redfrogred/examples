# examples (version 1.0.alpha.3)
This repo is a whack of examples (including how t start a project)

## LEFT OFF
* got html log

## NEXT STEPS 
  * make new pages in log yellow (or highlighted)

## FUTURE
  * ?

## REMEMBER
* To get webview working:
    + in pubspec.yaml
    + add webview_flutter: ^3.0.4
    
    + then, in: android/app/build.gradle
    + add: android { compileSdkVersion 32 }
    + then, in same file
    + make: minSdkVersion 30 // flutter.minSdkVersion
    +       targetSdkVersion 30 //flutter.targetSdkVersion

    + then, in android/app/src/main/AndroidManifest.xml
    + make: <uses-permission android:name="android.permission.INTERNET"/>   

