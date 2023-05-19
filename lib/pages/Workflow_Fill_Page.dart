// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Workflow_Fill_Page extends StatefulWidget {
  const Workflow_Fill_Page({ super.key });

  @override
  State createState() => _Workflow_Fill_PageState();
}

class _Workflow_Fill_PageState extends State<Workflow_Fill_Page> {

  _Workflow_Fill_PageState() {
    Utils.log( 'Workflow_Fill_Page.dart', '<<< init  >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Workflow_Fill_Page.dart';
    final List<String> passcodeTile = <String>[ 
      'Tico\'s Tex-Mex', 
      'Commercial & Fleet Vehicle...', 
      'Copy of Commercial & Fleet...',
      'DriveForm', 
      'Georgina Pilot culverts', 
      'HTML Flutter Test',
      'Matt\'s 2nd Form', 
      'Natt\'s First Friggin\' Form', 
      'Matt inside 1',
      'Neal', 
      'Test DropDown', 
      'Serious Form One',
      'Dark Matter Form', 
      'Elephant1', 
      'TEsttestTest Testtest test', ];

  // striping logic
  final List<Color> passcodeTileColor = <Color>[
    Color(0xFF000000),
    Color(0xFF111111)
  ];

  int _doStriping(int i) {
    if (i.isEven) {
      return 1;
    } else {
      return 0;
    }
  }
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
            title: const Text( 'Fill Form' ),
            centerTitle: true,
          ), //AppBar
          // drawer: DrawerWidget(),
          body: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    /*
                    Container(
                      height: 60,
                      width: double.infinity,
                      //color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,20,0,0),
                        child: Text('There are 16 Form Templates'),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          //top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                          bottom: BorderSide(width: 3.0, color: Colors.lightBlue.shade900),
                        ),),
                    ),
                   //  START of LISTVIEW BUILDER
                //        for showing Passcode tiles
                */
                passcodeTile.isNotEmpty
                  ? Expanded(
                      flex: 1,
                      child: Container(
                        //color: Colors.green,
                        color: Colors.transparent,
                        child: ListView.builder(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 13),
                          itemCount: passcodeTile.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Material(
                              color: passcodeTileColor[_doStriping(index)],
                              child: InkWell(
                                //splashColor: Colors.yellow,
                                onTap: () async {
                                  Utils.log( _fileName, 'Tapped item #' + index.toString());
                                  if ( index == 12) {
                                    Timer(Duration( milliseconds: Config.shortDelay), () {
                                      Navigator.of(context).pushNamed('Webview2_Page');
                                    });                                       
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      //color: passcodeTileColor[_doStriping(index)],
                                      child: Center(
                                        child: Icon(
                                          Icons.assignment_outlined,
                                          color: Color(0xFFFFFFFF),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 60,
                                        //color: passcodeTileColor[_doStriping(index)],
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 5, 15, 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('${passcodeTile[index]}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              index != 12 ?
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                                                                        
                                                child: Text(
                                                    'Last Filled: Never',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    )),
                                              )
                                              :  
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                                                                        
                                                child: Text(
                                                    'Last Filled: 2023-05-14',
                                                    style: TextStyle(
                                                      color: Colors.yellow,
                                                    )),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: Center(child: Text('( Passcode list empty )')),
                    ),


                //  END of LISTVIEW BUILDER
                //        for showing Passcode tiles
                  ],
                ),
              ),
              








        ),
      );
  }
}