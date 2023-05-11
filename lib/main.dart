import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      // initialRoute: 'StartPage',
      initialRoute: 'Webview1Page',
      routes: {
        'StartPage': (context) => const StartPage(),
        'EndPage': (context) => const EndPage(),
        'Webview1Page': (context) => const Webview1Page(),
      },
    );
  }
}