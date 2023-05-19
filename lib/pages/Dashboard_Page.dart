// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';    
import 'package:page_transition/page_transition.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../providers/Controller.dart';
import '../pages/_AllPages.dart';
import '../widgets/_AllWidgets.dart';

class Dashboard_Page extends StatefulWidget {
  Dashboard_Page({ Key? key }) : super(key: key);

  @override
  State<Dashboard_Page> createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {

   _Dashboard_PageState() {
    Utils.log( 'Dashboard_Page.dart', '<<< init >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Dashboard_Page.dart';  
  final TextStyle _linkButtonStyle = const TextStyle( color: Colors.white, fontWeight: FontWeight.normal, decoration: TextDecoration.underline );
  

  /*
  late WebViewController _controller;
  
  _loadHtmlFromAssets() async {
      String fileText = await rootBundle.loadString('assets/html/dashboard.htm');
      _controller.loadUrl( Uri.dataFromString(
          fileText,
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8')
      ).toString());
    }  
  */
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

    return WillPopScope( 
      onWillPop: () async {
        Utils.log( _fileName, ' << BACK BUTTON DENIED >>');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Config.mainBackgroundColor,
          appBar: AppBar(
            title: const Text( 'Dashboard'),
            centerTitle: true,
            primary: false,       
            actions: [
              IconButton(
                splashRadius: 20,
                icon: const Icon( Icons.wifi ),
                padding: EdgeInsets.zero,
                onPressed: () {

                },              
              ),             
              IconButton(
                splashRadius: 20,
                icon: const Icon( Icons.location_on ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  
                },              
              ), 
              IconButton(
                splashRadius: 20,
                icon: const Icon( Icons.warning_amber, color: Colors.red ),
                constraints: const BoxConstraints(),
                onPressed: () {
                  
                },              
              ),     
                      
            ]             
          ),
          drawer: Drawer_Widget(),
      
          body: Stack (
            children: [ 
              Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      //color: const Color(0xFF111111),
                      width: double.infinity,
                      /*
                      child: Center(  
                        child: WebView(
                          initialUrl: 'about:blank',
                          onWebViewCreated: (WebViewController webViewController) {
                            _controller = webViewController;
                            _loadHtmlFromAssets();
                          },
                        ),
                        child: Text('ok'),
                        */
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/dashboard_background_3.png"),
                            fit: BoxFit.none,
                          ),
                        ),
                        child: Dashboard_Mssg_Widget(),
                      )
                    ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Dashboard_UI_Widget(),
            
                    ),
                  ),
              ],
              ),



              // logout link
              Positioned(
                right: 4,
                bottom: 1,
                child: TextButton.icon(
                  icon: const Icon( Icons.logout, color: Colors.white), // Your icon here
                  label: Text('logout', style: _linkButtonStyle ), // Your text here
                  onPressed: () async {
                    String str = '';
                    str = await Dialog_Widget.alertDialog(context, 'Confirm Logout?','If you Logout you will lose any unsaved data.\n\nAre you sure?' );
                    if ( str == 'yes' ) {
                      setState(() {
                        //_welcomeMssg = 'Goodbye, Rodrigo...';
                      });
                      await Future.delayed( const Duration(seconds: 1) );
                      Navigator.push(
                        context, 
                        PageTransition(
                          alignment: Alignment.bottomCenter,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 600),
                          reverseDuration: const Duration(milliseconds: 600),
                          type: PageTransitionType.leftToRightJoined,
                          child: Start_Page(),
                          childCurrent: Dashboard_Page(),
                        ),
                      );
                    }
                  },
                ),
              ),            



              // settings link
              Positioned(
                left: 4,
                bottom: 1,
                child: TextButton.icon(
                  icon: Icon( Icons.settings, color: Colors.white), // Your icon here
                  label: Text('settings', style: _linkButtonStyle ), // Your text here
                  onPressed: (){

                  }
                ),
              )
            ],  
          ),
        ),
      ),
    );
  }
}