import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classes/Config.dart';
import 'providers/Controller.dart';
import './pages/_AllPages.dart';


void main() {
runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Config.mainFontColor, fontSize: Config.mainFontSize),
        ), 
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF232323),
            foregroundColor: Color(0xFFffffff),
            iconTheme: IconThemeData(color: Color(0xFFffffff)),
            titleTextStyle: TextStyle(
              height: 1,
              fontSize: 18,
            ),
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                MaterialStateProperty.all<Color>( Config.buttonBackgroundColor ),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.fromLTRB(10,10,10,10)),
            ),
          ),
      ),      
      //initialRoute: 'Start_Page',
      initialRoute: 'Dummy1_Page',
      routes: {
        'Start_Page': (context) => const Start_Page(),
        'End_Page': (context) => const End_Page(),
        'Dashboard_Page': (context) => const Dashboard_Page(),
        'Debug_Page': (context) => const Debug_Page(),
        'Dummy1_Page': (context) => const Dummy1_Page(),
        'Log_Page': (context) => const Log_Page(),
      },
    );
  }
}