// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Workflow_Page extends StatefulWidget {
  const Workflow_Page({ super.key });

  @override
  State createState() => _Workflow_PageState();
}

class _Workflow_PageState extends State<Workflow_Page> {

  _Workflow_PageState() {
    Utils.log( 'Workflow_Page.dart', '<<< init  >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Workflow_Page.dart';
  
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
            title: const Text( 'Workflow' ),
            centerTitle: true,
          ), //AppBar
          // drawer: DrawerWidget(),
          body: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,50,0,0),
                              child: SizedBox(
                                height: 110,
                                width: 150,
                                child: ElevatedButton.icon(
                                  
                                  icon: Icon(
                                    Icons.assignment_outlined,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                  label: Text(' View\nForms',  style: TextStyle( fontSize: 20, fontWeight: FontWeight.normal )),
                                  onPressed: () {
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    side: const BorderSide(
                                      width: 5, // the thickness
                                      color: Color(0xFF4DE1fF), // the color of the border
                                    ),
                                    padding: EdgeInsets.fromLTRB(10,20,10,20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('view completed forms',),
                            ),
                          ],
                        )
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 110,
                                width: 150,
                                child: ElevatedButton.icon(
                                  
                                  icon: Icon(
                                    Icons.assignment_turned_in_outlined,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                  label: Text(' Fill\nForm',  style: TextStyle( fontSize: 20, fontWeight: FontWeight.normal )),
                                  onPressed: () async {
                                    Timer(Duration( milliseconds: Config.shortDelay), () {
                                      Navigator.of(context).pushNamed('Workflow_Fill_Page');
                                    });                                
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    side: const BorderSide(
                                      width: 5, // the thickness
                                      color: Color(0xFF4DE1fF), // the color of the border
                                    ),
                                    padding: EdgeInsets.fromLTRB(10,20,10,20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('0 submitted (today)',),
                              ),
                            ],
                          ),
                        )
                      ),
                    ),                    
                  ],
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