


// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Dashboard_UI_Widget extends StatelessWidget {

  // (this class) variables
  static const String _fileName = 'Dashboard_UI_Widget.dart';  
  // cell padding and row stripe color for table
  final double _width = 8;
  final BoxDecoration _stripe = const BoxDecoration (color:  Color(0xFF222222) );

  // method for generating table cells
  TableCell _td ( String text, [ double sz = 16.0 ] ) {
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.top,
        child: Padding(
            padding: EdgeInsets.all(_width),
            child: Text( text, style: TextStyle( fontSize: sz )),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children:  [

        // see:
        // https://medium.com/flutter-community/table-in-flutter-beyond-the-basics-8d31b022b451
        // table
        Padding(
          padding: const EdgeInsets.fromLTRB(0,20,0,0),
          child:   Table(  
            columnWidths: const {
              0: FixedColumnWidth(150),
              1: FixedColumnWidth(220),
            },
            border: TableBorder.all(  
                color: Colors.transparent,  
                style: BorderStyle.solid,  
                width: 2),  
            children: [  
                
              TableRow( 
                decoration: _stripe,  // zebra stripe this row!
                children: [  
                  _td('Sesion start:'),  
                  _td('10:14am'),  
                ]
              ),  
              TableRow( 
                children: [  
                  _td('Session Length:'),  
                  _td('17 minutes ago'),  
                ]
              ),                   
              TableRow( 
                decoration: _stripe,  // zebra stripe this row!
                children: [  
                  _td('Internet Conn:'),  
                  _td('good'),  
                ]
              ),  
              TableRow( 
                children: [  
                  _td('Location:'),  
                  _td('good'),  
                ]
              ), 
              TableRow( 
                decoration: _stripe,  // zebra stripe this row!
                children: [  
                  _td('Message Alerts:'),  

                  // START: custom Table Cell for "Message Alerts"
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: Padding(
                        padding: EdgeInsets.all(_width),
                        child: Row(
                          children: const [
                            Text( '3 ', style: TextStyle( fontSize: 16 )),
                            Text( '( ', style: TextStyle( fontSize: 16 )),
                            Text( 'view', style: TextStyle( fontSize: 16, color: Colors.red, decoration: TextDecoration.underline )),
                            Text( ' )', style: TextStyle( fontSize: 16 )),
                          ],
                        ),
                    ),
                ),
                // END: custom Table Cell for "Message Alerts"

                ]
              ), 
              TableRow( 
                children: [  
                  _td('Flat Tires:'),  
                  _td('none'),  
                ]
              ),                                                                     
            ],  
          ),
        ),



        // legend
        /*
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text('Use Git branch names to see working examples...'),
        ),
        */
      ],
    );
  }
}