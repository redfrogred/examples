// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Webview1_Page extends StatefulWidget {
  const Webview1_Page({ super.key });

  @override
  State createState() => _Webview1_PageState();
}

class _Webview1_PageState extends State<Webview1_Page> {

  _Webview1_PageState() {
    Utils.log( 'Webview1_Page.dart', '<<< init  >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Webview1_Page.dart';
  static late WebViewController _webViewController;
  
  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log( _fileName, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));
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
  
  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( _fileName, ' _addPostFrameCallbackTriggered()');
  }

  // (this page) build
  @override
  Widget build(BuildContext context) {

    _buildTriggered();

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,  
          appBar: AppBar(
            title: const Text( _fileName + ' (${Config.appVersion})' ),
            centerTitle: true,
          ), //AppBar
          // drawer: DrawerWidget(),
          body: Container(
            child: WebView(
              initialUrl: 'https://panelsplus.net/other/webview/1/d/',
              javascriptMode: JavascriptMode.unrestricted,
              javascriptChannels: {
                JavascriptChannel(
                  name: 'Print',
                  onMessageReceived: (JavascriptMessage message) {
                    Utils.log( _fileName, message.message);
                  }
                ),
                JavascriptChannel(
                  name: 'APP_JQUERY_LOADED',
                  onMessageReceived: (JavascriptMessage message) {
                    Utils.log( _fileName, message.message);
                  }
                ),                
              },
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            ),
          ),
        ),
      );
  }
}