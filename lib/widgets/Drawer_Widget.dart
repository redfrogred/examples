import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Drawer_Widget extends StatelessWidget {
  Drawer_Widget ({Key? key}) : super(key: key);

  // (this class) variables
  static const String _fileName = 'Drawer_Widget.dart';    
  Color _color = Color(0xFF666666); 

  // create an associative array that pairs
  // String "labels" with their icons
  Map<String, IconData> icn = {
    'Dashboard'             : Icons.home,
    'Dispatch'              : Icons.feedback,
    'Devices'               : Icons.important_devices,
    'Workflow'              : Icons.assignment,
    'Things'                : Icons.grain,
    'Scan Code'             : Icons.settings_remote,
    'My Location'           : Icons.location_on,
    'Logout'                : Icons.logout,
    'Debug'                 : Icons.bug_report,
  };

  ListTile _getNavItem( context, String label ) {
    return ListTile(
      // contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),      
      leading: Icon( icn[label], color: Colors.white ),
      title: Text( label, style: TextStyle( color: Colors.white, fontSize: 16 )),
      onTap: () async {
        //Log.info('(method) Drawer_Widget._getNavItem() tapped ' + label);

        switch( label ) {
          case 'Logout': { 
            // Config.appMode = 0;
            //Navigator.of(context).pushReplacementNamed('StartPage');
            await Future.delayed( const Duration(milliseconds: 650) );
                    Navigator.of(context).pushReplacementNamed('Start_Page');            
          }
          break;
          case 'Dispatch' : {
            //Navigator.of(context).popAndPushNamed('Dispatch_Page');
          }          
          break;          
          case 'Devices' : {
            //Navigator.of(context).popAndPushNamed('Devices_Page');
          }          
          break;
          case 'My Location' : {
            //Navigator.of(context).popAndPushNamed('Devices_Page');
          }      
          break;          
          case 'Settings' : {
            // Navigator.of(context).popAndPushNamed('Settings_Page');
          }
          break;
          case 'Debug' : {
            Navigator.of(context).popAndPushNamed('Debug_Page');
          }
          break;
          case 'Workflow' : {
            //Provider.of<Controller>(context, listen: false).updateDashboardMssg();           
            Timer(Duration( milliseconds: Config.shortDelay), () {
              Navigator.of(context).popAndPushNamed('End_Page');
            });

          }
          break;                    
          default: { 
            Utils.log ( 'Drawer_Widget.dart','no selection made' ); 
            Navigator.pop(context);
          }
          break;
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Color(0xFF1a1a1a),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/drawer_logo.png"),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                  //color: Colors.red,
                ),
              ),
            ),
            ),
          
          
          // START "Drawer Items"
          // Divider( color: _color ), 
          _getNavItem( context, 'Dashboard'),
          Divider( color: _color ),          
          //_getNavItem( context, 'Dispatch'),
          //Divider( color: _color ),
          _getNavItem( context, 'Devices'),
          Divider( color: _color ),
          _getNavItem( context, 'Workflow'),
          Divider( color: _color ),
          //_getNavItem( context, 'Things'),
          //Divider( color: _color ),
          //_getNavItem( context, 'Scan Code'),
          //Divider( color: _color ),          
          _getNavItem( context, 'My Location'),
          Divider( color: _color ),
          _getNavItem( context, 'Logout'),
          Divider( color: _color ),       
          Visibility(
            visible: Config.appDebugActive,
            child: _getNavItem( context, 'Debug')
          ),             
          // END "Drawer Items"

        ],
      ),
    );
  }
}