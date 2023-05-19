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
    Utils.log( 'Start_Page.dart', '<<< init "${ Config.appName }" version ${ Config.appVersion } >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Start_Page.dart';
  //  only 3 variables used for login... if the button is grey, it
  //  means login in process...
  String?   _mssg = '';
  Color?    _loginBtnColor = Config.buttonBackgroundColor;
  bool?     _showErrorIcon = false;  
  // textfield controllers
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();  
  
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
    _controller1.dispose();
    _controller2.dispose();    
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log( _fileName, ' _buildTriggered()');
  }

  void _resetForm( String mssg ) {
    setState(() {
      _mssg = mssg;
      _loginBtnColor = Config.buttonBackgroundColor;
      if ( _mssg != '' ) { _showErrorIcon = true; }
    });
  }
  
  void _attemptLogin( context, cont ) {
    if( _controller1.text == '' && _controller2.text == '') {
      _controller1.text = 'black.berry';
      _controller2.text = 'pw1234';
    }      
    if( _controller1.text == '' || _controller2.text == '') {
      _resetForm( 'user/password blank!' );
    }
    else { 
      // u: black.berry
      // p: pw1234
      /*
      String? url = 'https://ec2.qbitmobile.com/services/login.aspx?username=${ _controller1.text }&pw=${ _controller2.text }&format=json&_=1661270274227';
      http.get(Uri.parse(url))
          .then((response) {
        //print("Response status: ${response.statusCode}");
        //print("Response body: ${response.body}");
        Http_Reply http_reply = Http_Reply.fromJson(jsonDecode(response.body));
        // Utils.log(http_reply.loginResponse!.status.toString());
        if ( http_reply.loginResponse!.status.toString() == 'ok' ) {
          Utils.log("Login Good! Response body: ${response.body}");
          Navigator.of(context).pushReplacementNamed('DashboardPage');
        }
        else {
          Utils.log("Login Failed with ${ _controller1.text }/${ _controller2.text }: Response body: ${response.body}");
          _resetForm( 'user/password wrong!' );
        }
      });  
      */
      Timer(const Duration(seconds: 2), () {
        Utils.log( _fileName, "_attemptLogin() 2 second delay");
        //_resetForm( 'conn problem' );
        Provider.of<Controller>(context, listen: false).initApp();
        Navigator.of(context).pushReplacementNamed('Dashboard_Page');        

      });        
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
        Utils.log( _fileName, ' << BACK BUTTON DENIED >>');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Config.mainBackgroundColor,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,70,0,30),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/fluid_logo_darkmode_1.png"),
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                        ),
                        //color: Colors.red,
                      ),
                    ),
                  ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
            
            
            
            
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: _showErrorIcon!,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.warning_amber_outlined, color: Colors.red),
                                    ),
                                  ),
                                  Text( _mssg! ),
                                  Visibility(
                                    visible: _loginBtnColor != Config.buttonBackgroundColor,
                                    child:  const Padding(
                                      padding: EdgeInsets.fromLTRB(12,0,0,0),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Color(0xFFcccccc),
                                          )
                                        ),
                                      ),
                                    ),  
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
            
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    controller: _controller1,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,  
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(),
                                      labelText: 'username',
                                      contentPadding: EdgeInsets.fromLTRB(10,5,10,5)
                                    ),
                                    
                                  ),
                                ),
                              ),    
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: TextField(
                                    controller: _controller2,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,  
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(),
                                      labelText: 'password',
                                      contentPadding: EdgeInsets.fromLTRB(10,5,10,5)
                                    ),
                                  ),
                                ),
                              ),                        
                            ],
                          ),
                        ),
            
            
            
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.transparent,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if ( _loginBtnColor != Config.buttonBackgroundColor ) { 
                                    Utils.log ( _fileName, 'login clicked / but button disabled');
                                  }
                                  else {
                                    Utils.log ( _fileName, 'login clicked ');
                                    setState(() {
                                      _loginBtnColor = Colors.grey;
                                      _mssg = 'logging in...';
                                      _showErrorIcon = false;
                                    });

                                    //-------------------
                                    // ATTEMPT LOGIN HERE
                                    //-------------------
                                    _attemptLogin( context, context.read<Controller>() );
                                  }
                                }, 
                                child: const Text('login'),
                                style: ElevatedButton.styleFrom(
                                  primary: _loginBtnColor,
                                  textStyle: TextStyle(fontSize: 16 )
                                ),
                              ),
                            ),
                          ),
                        ),
            
            
            
                      ],
                    ),
                  ),   
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.transparent,
                      child: const Center(
                                child: Text('Forgot password?', style: TextStyle(  decoration: TextDecoration.underline, )),
                              ),
                    ),
                  ),                 
                ],
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