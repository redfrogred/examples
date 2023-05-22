// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';
import '../widgets/_AllWidgets.dart';

class Dashboard_Page extends StatefulWidget {
  const Dashboard_Page({ super.key });

  @override
  State createState() => _Dashboard_PageState();
}

class _Dashboard_PageState extends State<Dashboard_Page> {

  _Dashboard_PageState() {
    Utils.log( 'Dashboard_Page.dart', '<<< init  >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Dashboard_Page.dart';
  
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
          drawer: Drawer_Widget(),
          body: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Center(
                  child: ElevatedButton(
                    child: Text('<< Go To STARTPAGE'),
                    onPressed: () {
                      Utils.log( _fileName, '( $_fileName ) (event) clicked "go to Star_tPage()"');
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Start_Page())
                      );                
                    },
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: ( 
                  //Text( Config.appVersion + ' (${ Config.pops.toString() })' )
                  Text( context.watch<Controller>().getAppInfo() )
                ),
              )
            ],
          ),
        ),
      );
  }
}