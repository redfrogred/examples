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
                    Row(
                      children: [ 
                        SizedBox(
                          width: 90,
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
                          padding: EdgeInsets.fromLTRB(0,12,12,0),
                          child: Text('Toggle "Config.appDebugActive"'),
                        ),                        
                      ]  
                    ),
                    Row(
                      children: [ 
                        SizedBox(
                          width: 90,
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
                          padding: EdgeInsets.fromLTRB(0,12,12,0),
                          child: Text('Toggle "Config.appDkMdActive"'),
                        ),                        
                      ] 
                    ),    
                    Row(
                      children: [ 
                        SizedBox(
                          width: 90,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15,12,12,0),
                            child: ElevatedButton(
                              child: Text('Log'),
                              onPressed: () {
                                Utils.log( _fileName, '( $_fileName ) (event) clicked "go to Log_Page()"');
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Log_Page())
                                );      
                              },
                            ),
                          ),
                        )                     
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