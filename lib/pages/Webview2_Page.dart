// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../providers/Controller.dart';
import '../widgets/Dialog_Widget.dart';

class Webview2_Page extends StatefulWidget {
  const Webview2_Page({ super.key });

  @override
  State createState() => _Webview2_PageState();
}

class _Webview2_PageState extends State<Webview2_Page> {

  _Webview2_PageState() {
    Utils.log( 'Webview2_Page.dart', '<<< init  >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Webview2_Page.dart';
  // webview stuff
  static late WebViewController _webViewController;
  static String WEB_APP_VERSION = '';
  static String WEB_JQUERY_LOADED = 'false';
  static num    WEB_REQUIRED_FIELDS = 0;
  static String WEB_FORM_JSON  = ''; 
  // spinner stuff
  static String _spinner_mssg = '';
  static bool   _show_spinner_flag = true;
  // page status 0=first load, 1=webview completed, 2=submitted
  static num    _page_status = 0;

  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log( _fileName, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));
    _spinner_mssg = 'fetching form...';
  }

  @override
  void dispose() {
    Utils.log( _fileName, ' dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log( _fileName, ' _buildTriggered()');
  }

  void _verify_exit () async {
    Utils.log( _fileName, '_verify_exit()');
    //  the back arrow was clicked after the webview loaded, so
    //  warn user that cny changes will be lost
    String str = '';
    str = await Dialog_Widget.alertDialog(context, 'Discard Changes?','Your form was not submitted. Any unsaved data will be lost.\n\nAre you sure you to leave?' );
    if ( str == 'yes' ) {
      Navigator.of(context).pop();
    }    
  }

  void _form_submitted () {
    Utils.log( _fileName, '_form_submitted() on da FLUTT side');
    _page_status = 2; // disables "back"
    _activate_spinner('submitting...');
    Timer(Duration( milliseconds: Config.longDelay), () {
      // all is good, so update Dashboard Mssg
      //context.read<Controller>().updateDashboardMssg('Form Submitted!','You successfully submitted a form.', Colors.green, Icons.check_circle );
      context.read<Controller>().updateDashboardMssg( headline: 'Form Submission Error', txt:'The form could not be submitted because the connection was lost.\n\nTo try again, see Message Alerts.', color: Colors.red, icn: Icons.warning );
      Navigator.popUntil(context, ModalRoute.withName('Dashboard_Page'));
    });
  }
  
  void _form_lacks_required() async {
    Utils.log( _fileName, '_form_lacks_required()...');
    String str = '';
    str = await Dialog_Widget.alertDialog(context, 'Issues Detected','Your form is missing ${WEB_REQUIRED_FIELDS.toString() } required fields.\n\nAre you sure you want to submit?' );
    if ( str == 'yes' ) {
      _form_submitted ();
    }
    else {
      Utils.log( _fileName, 'runJavascript("showRequired()")');
      _webViewController.runJavascript('showRequired()');
    }
  }

  void _activate_spinner(String str) {
    if ( str != '' ) {
      setState(() {
        _spinner_mssg = str;
        _show_spinner_flag = true;
      });
    }
    else {
        _spinner_mssg = '';
        _show_spinner_flag = false;
    }
  }

  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( _fileName, ' _addPostFrameCallbackTriggered()');
  }

  // (this page) build
  @override
  Widget build(BuildContext context) {

    _buildTriggered();

    return WillPopScope(
        onWillPop: () async {
          if( _page_status == 0 ) {
            return true;
          }
          else {
            if( _page_status == 1 ) {
              _verify_exit();
              return false;
            }
            else {  
              // _page_status == 3, which means cancel the back button
              Utils.log( _fileName, 'back button canceled (cuz form submitted!)');
              return false;
            }
          }
      },
      child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,  
            appBar: AppBar(
              title: const Text( 'Fill Form' ),
              centerTitle: true,
              actions: <Widget>[
                Visibility(
                  visible: !_show_spinner_flag,
                  child: IconButton(
                    icon: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.white,
                    size: 30,
                    ),
                    onPressed: () async {
                      Utils.log( _fileName, 'submitForm()');
                      _webViewController.runJavascript('submitForm()');
                    },
                  ),
                ),
              ],                    
            ), //AppBar
            // drawer: DrawerWidget(),
            body: Stack(
              children: [
                Container(
                  child: WebView(
                    initialUrl: 'https://panelsplus.net/other/webview/2/f/',
                    onPageFinished: (String url) async {
                      _page_status = 1;
                      await Future.delayed( Duration(milliseconds: Config.longDelay) );
                      if (!mounted) return;
                      setState(() {
                        _show_spinner_flag = false;
                      });
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                    javascriptChannels: {
                      JavascriptChannel(
                        name: 'WEB_APP_VERSION',
                        onMessageReceived: (JavascriptMessage str) {
                          Utils.log( _fileName, 'WEB_APP_VERSION = ' + str.message);
                          WEB_APP_VERSION = str.message;
                        }
                      ), 
                      JavascriptChannel(
                        name: 'WEB_JQUERY_LOADED',
                        onMessageReceived: (JavascriptMessage str) {
                          Utils.log( _fileName, 'WEB_JQUERY_LOADED = ' + str.message);
                          WEB_JQUERY_LOADED = str.message;
                        }
                      ),
                      JavascriptChannel(
                        name: 'WEB_REQUIRED_FIELDS',
                        onMessageReceived: (JavascriptMessage str) {
                          Utils.log( _fileName, 'WEB_REQUIRED_FIELDS = ' + str.message);
                          WEB_REQUIRED_FIELDS = int.parse(str.message);
                          if( WEB_REQUIRED_FIELDS == 0) {
                            _form_submitted();
                          }
                          else {
                            _form_lacks_required();
                          }
                        }
                      ),  
                      JavascriptChannel(
                        name: 'WEB_FORM_JSON',
                        onMessageReceived: (JavascriptMessage str) {
                          Utils.log( _fileName, 'WEB_FORM_JSON = ' + str.message);
                          WEB_FORM_JSON = str.message;
                        }
                      ),                
                    },
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                  ),
                ),
                Positioned(
                  child: Visibility(
                    visible: _show_spinner_flag,
                    // START OF SPINNER
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Config.mainBackgroundColor,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFcccccc),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text( _spinner_mssg, textAlign: TextAlign.center, ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // END OF SPINNER
                  ) 
                )
              ],
            ),
          )
        ),
    );
  }
}