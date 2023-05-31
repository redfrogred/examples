// ignore_for_file: prefer_const_constructors, camel_case_types


//  From:
//  https://www.youtube.com/watch?v=E3SQOqUq8Mg

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../widgets/_AllWidgets.dart';
import '../providers/Controller.dart';
import '../classes/AlertItem.dart';

class Ex_AnimatedList_Page extends StatefulWidget {
  const Ex_AnimatedList_Page({ super.key });

  @override
  State createState() => _Ex_AnimatedList_PageState();
}

class _Ex_AnimatedList_PageState extends State<Ex_AnimatedList_Page> {

  _Ex_AnimatedList_PageState() {
    Utils.log( 'Ex_AnimatedList_Page.dart', '<<< init  >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Ex_AnimatedList_Page.dart';
  // animated list stuff
  final listKey = GlobalKey<AnimatedListState>();
  final List<AlertItem> items = List.from(Config.alertItems);
  int _count = Config.alertItems.length;

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

  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => AlertItemWidget(
        item: removedItem,
        animation: animation,
        onClicked: () {},
        num: index,
      ),
      duration: Duration(milliseconds: 333),
      
    );
    Utils.log( _fileName, 'items = ' + items.length.toString());
    setState(() {
      _count = items.length;
    });
  }

  String _showCount() {
    if ( _count == 1 ) {
      return 'You have 1 alert';
    }
    else {
      return 'You have ${_count.toString() } alerts';
    }
    
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
          body: 
          
          ( _count == 0 ) 
          ?
            Center(child: Text('( no alerts )'))
          :
          Column(
            children: [
              Container(
                height: 50,
                child: Center(child: Text ( _showCount() )),
              ),
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: items.length,
                  itemBuilder: (context, index, animation ) => AlertItemWidget(
                    item: items[index],
                    animation: animation,
                    onClicked: () { removeItem(index);},
                    num: index,
                  ),
                ),
              ),
            ],
          ),

        ),
      );
  }
}

class AlertItemWidget extends StatelessWidget {
  final AlertItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;
  final int num;

  const AlertItemWidget({
    required this.item,
    required this.animation,
    required this.onClicked,
    required this.num,
    Key? key,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) => SizeTransition( 
    sizeFactor: animation,
    child: buildItem(),
  );

  Widget buildItem() => Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15,9,15,0),
            child: Column(
              children: [
                //Text( Config.alertMssg[index], style: TextStyle( color: Colors.red )),
                SizedBox(
                  width: double.infinity,
                  child: Text( item.title, style: TextStyle( color: Colors.red ))),
                SizedBox(
                  width: double.infinity,
                  child: Text( item.description, style: TextStyle( color: Colors.white ))),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text( item.details, style: TextStyle( color: Config.accent1Color )),
                    ],
                  ),
                ),       
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,9,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {}, 
                          child: Text('retry submission'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Config.statusColor[3],
                          ),    
                      ),
                      TextButton(
                          onPressed: onClicked, 
                          child: Text('dismiss'),
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            foregroundColor: Config.accent1Color,
                          )
                        ),                                          
                      ],
                    ),
                  ),
                ),       
                Divider(
                  color: Config.statusColor[3],
                  thickness: 2,
                ),  
              ],
            ),
          ),
        );  
}