// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Log_Page extends StatefulWidget {
  const Log_Page({ super.key });

  @override
  State createState() => _Log_PageState();
}

class _Log_PageState extends State<Log_Page> {

  _Log_PageState() {
    Utils.log( 'Log_Page.dart', '<<< init >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Log_Page.dart';
  
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
          backgroundColor: Config.mainBackgroundColor,
          appBar: AppBar(
            title: const Text( _fileName ),
            centerTitle: true,
          ), //AppBar
          // drawer: DrawerWidget(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SingleChildScrollView(child: Text(Config.log)),
            ),
          ),
        ),
      );
  }
}