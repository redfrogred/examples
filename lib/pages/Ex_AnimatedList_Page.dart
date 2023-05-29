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
import '../classes/ListItem.dart';

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
  final List<ListItem> items = List.from(Config.listItems);
  int _count = Config.listItems.length;

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
      (context, animation) => ListItemWidget(
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
            Center(child: Text('no items'))
          :
          Column(
            children: [
              Container(
                height: 50,
                child: Center(child: Text ( _count.toString() )),
              ),
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: items.length,
                  itemBuilder: (context, index, animation ) => ListItemWidget(
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

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClicked;
  final int num;

  const ListItemWidget({
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
    margin: EdgeInsets.all(8),
    color: Colors.green,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: double.infinity, child: Text( item.title, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20, ))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: double.infinity, child: Text( item.description)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: double.infinity, child: ElevatedButton(
            child: Text('remove ${ num.toString() }'),
            onPressed: onClicked, // WILLFIX
          )),
        ),    
        ( num < Config.listItems.length-1 ) ? SizedBox(height: 1) : 
        Container(
          color: Config.mainBackgroundColor,
          width: double.infinity,
          height: 100,
          child: Center(
            // child: Text('( end of alerts )'),
          )  
        )   
      ],
    ),
  );  
}