# EXAMPLES

This is a repo for various demos and examples of code. It is for me to re-use, but also open to the public.
## BRANCHES

* main
* starter2 - latest start template

## LEFT OFF
* got html page passing vae to flutter
  + using https://panelsplus.net/other/webview/1/d/ and Webview!Page.dart  
  + now I am making more complicated example...  

## HISTORY
* created new project
* added structure
* added webview
    + in pubspec.yaml
    + add webview_flutter: ^3.0.4
    
    + then, in: android/app/build.gradle
    + add: android { compileSdkVersion 32 }
    + then, in same file
    + make: minSdkVersion 30 // flutter.minSdkVersion
    +       targetSdkVersion 30 //flutter.targetSdkVersion

    + then, in android/app/src/main/AndroidManifest.xml
    + make: <uses-permission android:name="android.permission.INTERNET"/>    
    
