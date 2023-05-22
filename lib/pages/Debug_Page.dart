// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Debug_Page extends StatefulWidget {
  const Debug_Page({ super.key });

  @override
  State createState() => _Debug_PageState();
}

class _Debug_PageState extends State<Debug_Page> {

  _Debug_PageState() {
    Utils.log( 'Debug_Page.dart', '<<< init >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Debug_Page.dart';
  static const double _buttonWidth = 120;     // the width of the buttons on the left
  
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
          body: Stack(
            children: [
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [


                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,50,0,10),
                        child: Text('~ Log functions ~'),
                      ),
                    ),                    
                    Row(
                      children: [ 
                        SizedBox(
                          width: _buttonWidth,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Log'),
                              onPressed: () {
                                Utils.log( _fileName, '(event) clicked "go to Log_Page()"');
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Log_Page())
                                );      
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('show log'),
                        ),                                               
                      ] 
                    ),   
                    Row(
                      children: [ 
                        SizedBox(
                          width: _buttonWidth,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Stamp'),
                              onPressed: () {
                                // don't show loggin of stamp
                                //Utils.log( _fileName, '(event) clicked "Utils.stampLog()"');
                                Utils.stampLog();     
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('mark with timestamp'),
                        ),                                               
                      ] 
                    ),    
                    Row(
                      children: [ 
                        SizedBox(
                          width: _buttonWidth,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Clear'),
                              onPressed: () {
                                Utils.log( _fileName, '(event) clicked "Utils.clearLog()"');
                                Utils.clearLog();    
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('clear log'),
                        ),                                               
                      ] 
                    ),                                                                       







                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,50,0,10),
                        child: Text('~ Other functions ~'),
                      ),
                    ),
                    Row(
                      children: [ 
                        SizedBox(
                          width: _buttonWidth,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Off'),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('toggle "debug" mode'),
                        ),                        
                      ]  
                    ),
                    Row(
                      children: [ 
                        SizedBox(
                          width: _buttonWidth,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Reset'),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('reset app'),
                        ),                        
                      ] 
                    ),   
                    Row(
                      children: [ 
                        SizedBox(
                          width: _buttonWidth,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Quit'),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12,12,12,0),
                          child: Text('quit app'),
                        ),                        
                      ] 
                    ),                      
                  ]
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