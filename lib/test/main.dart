// https://codelabs.developers.google.com/codelabs/flutter-app-testing/

import 'package:flutter/material.dart';
import 'package:flutter_codelab_study/test/screens/home.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
