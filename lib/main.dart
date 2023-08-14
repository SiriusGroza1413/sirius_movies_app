import 'package:flutter/material.dart';

import 'package:sirius_movies_app/src/pages/home_page.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.indigoAccent,
          titleTextStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 25.0 
          ),
          shadowColor: Colors.blue
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'GMA',
      initialRoute: '/',
      routes: {
        '/' :  ( BuildContext contex ) => HomePage(),
      }
    );
  }
}
