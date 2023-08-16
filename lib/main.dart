import 'package:flutter/material.dart';

import 'package:sirius_movies_app/src/pages/home_page.dart';
import 'package:sirius_movies_app/src/pages/movie_detail.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      debugShowCheckedModeBanner: false,
      title: 'GMA',
      initialRoute: '/',
      routes: {
        '/' :  ( BuildContext contex ) => HomePage(),
        'detail' : (BuildContext context) => MovieDetailPage(),
      }
    );
  }
}
