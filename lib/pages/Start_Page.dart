// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Start_Page extends StatefulWidget {
  const Start_Page({ super.key });

  @override
  State createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {

  _Start_PageState() {
    Utils.log( 'Start_Page.dart', '<< init "${ Config.appName }" version ${ Config.appVersion } >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Start_Page.dart';
  
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

  return WillPopScope( 
      onWillPop: () async {
        Utils.log( _fileName, ' << BACK BUTTON DENIED >>');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Config.mainBackgroundColor,
          appBar: AppBar(
            title: const Text( _fileName ),
            centerTitle: true,
          ), //AppBar
          // drawer: DrawerWidget(),          
          body: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Center(
                  child: ElevatedButton(
                    child: Text('Go To DASHBOARD >>'),
                    onPressed: () {
                      Utils.log( _fileName, '( $_fileName ) (event) clicked "go to Dashboard_Page()"');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Dashboard_Page())
                      );                
                    },
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Text( Config.appVersion.toString() ),
              )
            ],  
          ),
        ),
      ),  
    );
  }
}