import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../classes/Config.dart';

class Dialog_Widget {

  // (this class) variables
  static const String _fileName = 'Dialog_Widget.dart';   

  //  The "warningDialog" accepts 3 parameters:
  //    1 - an array of strings (each string is an error description lie "invalid email address"), and
  //    2 - an optional string "titleText" (if not provided it defaults to "Warning")
  //    3 - an optional icon (if not provided it defaults to "Warning")
  //        though another good one is "Icons.warning_amber_outlined" if it is more
  //        of an informational sort-a-thing....
  
  static warningDialog(BuildContext _context, [List<String>? arr, String titleText = "Warning", IconData icn = Icons.warning_amber_outlined ]) async {

      String arrHeading = 'The form has an error:';
      String arrConclusion = 'Please correct the error and submit it again.';

      const TextStyle _txtStyle = TextStyle(color: Color(0xffcccccc), fontSize: 16); 

      if ( arr!.length > 1  ) {
        arrHeading = 'The form has ' + arr.length.toString() + ' errors:';
        arrConclusion = 'Please correct these errors and submit it again.';
      }

      // getCol and getCol combine to create an ordered list, where
      // each error gets a number and a text description.
      Row getRow( int index ) {
        String str =  arr[index]; 
        return Row( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
              child: Align(alignment: Alignment.centerRight, child: Text('${ (index+1).toString() }. ', style: _txtStyle )),
            ),
            Expanded(
              child: Text( str, style: _txtStyle ),
            ),
          ],
        );  
      }

      Column getCol() {
        var widgetList = <Widget>[];
        for (int i=0; i < arr.length; i++) {
          // Add list item
          widgetList.add(getRow(i));
          // Add space between items
          widgetList.add(const SizedBox(height: 5.0));
        }        
        return Column( 
          mainAxisSize: MainAxisSize.min, 
          children: widgetList,
        );
      }

    await showDialog(
      context: _context,
      barrierColor: const Color(0x00ffffff),
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),          
					title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                icn,
                color: Color(0xFFcccccc),
                size: 24.0,
              ),
              Text(' ' + titleText,
                  style:
                      const TextStyle(color: Color(0xffcccccc), fontSize: 16)),
                      
            ],
            
          ),
          
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
                child: Align(alignment: Alignment.centerLeft, child: Text( arrHeading, style: _txtStyle )),                   
              ),              
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: getCol(),                   
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 8),
                child: Text( arrConclusion, style: _txtStyle ),                   
              ),              

            ],
          ),
          actions: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Divider(
                color: Color(0xFFcccccc),
                height: 5,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
            ),
            // spread out dialog buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox.fromSize(
                  size: const Size(52, 52),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      color: const Color(0xFF666666), // button color
                      child: InkWell(
                        splashColor: const Color(0xFFeeeeee), // splash color
                        //onTap: () {}, // button pressed
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            // icon
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //const Spacer(),
          ],
        );
      },
    );

    return;
  }








  //  The "infoDialog" accepts 3 parameters:
  //    1 - a String defaultText which is the descriptive text, and
  //    2 - an optional String "titleText" (if not provided it defaults to "Warning")
  //    3 - a status int (0 = info, 1 = checkmark, 2 = error )
  //  Unlike its sister method "warningDialog," the same icon is always used,
  //  and no array is passed for error messages
  // 
  static infoDialog(BuildContext _context,
      [String defaultText = "No message body supplied...", String titleText = "Attention!", int status = 0 ]) async {
    List<IconData> _statusIcon = [
      Icons.warning_amber_outlined,
      Icons.check_circle_outline_outlined,
      Icons.warning_amber_outlined, 
    ];

    List<Color> _statusColor = [
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    
    await showDialog(
      context: _context,
      barrierColor: Colors.black.withOpacity(0.75),
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          //title: ,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                _statusIcon[status],
                color: _statusColor[status],
                size: 24.0,
              ),
              Text(
                ' $titleText',
                style: const TextStyle(
                  color: Color(0xFFcccccc),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFF222222),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 2.0)
            ),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(defaultText,
                style: const TextStyle(color: Color(0xffcccccc), fontSize: 16)),
          ),
          actions: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Divider(
                color: Color(0xFFcccccc),
                height: 5,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
            ),
            // spread out dialog buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('ok', style: TextStyle( color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16 ),
                    primary: _statusColor[status],
                    //primary: Colors.grey,
                  ),
                  onPressed: () {
                    Navigator.pop( context );
                  },
                ), 
              ],
            ),
            //const Spacer(),
          ],
        );
      },
    );

    return;
  }














  //  The "alertDialog" DOES STUFF!  And accepts 3 parameters:
  //    1 - an optional String "titleText" (if not provided it defaults to "Warning")
  //    2 - a String defaultText which is the descriptive text, and
  //    3 - a status int (0 = info, 1 = checkmark, 2 = error )
  //  Unlike its sister method "warningDialog," the same icon is always used,
  //  and no array is passed for error messages
  // 
  static Future<String> alertDialog(BuildContext _context,
      [ String titleText = "Attention!", String defaultText = "No message body supplied...", int status = 0 ]) async {
    List<IconData> _statusIcon = [
      Icons.warning_amber_outlined,
      Icons.check_circle_outline_outlined,
      Icons.warning_amber_outlined, 
    ];

    List<Color> _statusColor = [
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    String? _retVal = '';
    
    await showDialog(
      context: _context,
      barrierColor: Colors.black.withOpacity(0.75),
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 23),
          //title: ,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Icon(
                _statusIcon[status],
                color: _statusColor[status],
                size: 24.0,
              ),
              Text(
                ' $titleText',
                style: const TextStyle(
                  color: Color(0xFFcccccc),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF222222),
          insetPadding: const EdgeInsets.all(35),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 2.0)
            ),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(defaultText,
                style: const TextStyle(color: Color(0xffcccccc), fontSize: 16)),
          ),
          actions: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
              child: Divider(
                color: Color(0xFFcccccc),
                height: 5,
                thickness: 2,
                indent: 5,
                endIndent: 5,
              ),
            ),
            // spread out dialog buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
SizedBox.fromSize(
	size: const Size(40,40),
	child: ClipRRect(
		borderRadius: BorderRadius.circular(40),
		child: Material(
			color: Colors.green, // button color
			child: InkWell(
				splashColor: Colors.green, // splash color
				//onTap: () {}, // button pressed
				onTap: () {
					Navigator.pop(context);
					_retVal = 'yes';
				},
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: const <Widget>[
						Icon(
							Icons.check,
							color: Colors.black,
						),
						// icon
					],
				),
			),
		),
	),
),      
SizedBox(
  width: 10,
),              
SizedBox.fromSize(
	size: const Size(40,40),
	child: ClipRRect(
		borderRadius: BorderRadius.circular(40),
		child: Material(
			color: Colors.grey, // button color
			child: InkWell(
				splashColor: Colors.grey, // splash color
				//onTap: () {}, // button pressed
				onTap: () {
					Navigator.pop(context);
					_retVal = 'no';
				},
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: const <Widget>[
						Icon(
							Icons.close,
							color: Colors.black,
						),
						// icon
					],
				),
			),
		),
	),
),              ],
            ),
            //const Spacer(),
          ],
        );
      },
    );

    return _retVal!;
  }
}

