import 'package:flutter/material.dart';
import 'package:kodilan/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodilan',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[600],
        scaffoldBackgroundColor: Color(0XFFF3F6FC),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}

