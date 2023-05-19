// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../classes/Config.dart';
import '../providers/Controller.dart';
class Dashboard_Mssg_Widget extends StatelessWidget {

  // (this class) variables
  static const String _fileName = 'Dashboard_Mssg_Widget.dart';  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              context.watch<Controller>().getDashboardIcon(),
              color: context.watch<Controller>().getDashboardColor(),
              size: 42.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                context.watch<Controller>().getDashboardHeadline(),
                style: TextStyle( color: context.watch<Controller>().getDashboardColor(), fontSize: 20, fontWeight: FontWeight.bold ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
          child: Text( context.watch<Controller>().getDashboardText() ),
        ),
      ],
    );
  }
}

