// https://codelabs.developers.google.com/codelabs/flutter-app-testing/

import 'package:flutter/material.dart';
import 'package:flutter_codelab_study/test/models/favorites.dart';
import 'package:flutter_codelab_study/test/screens/FavoritesPage.dart';
import 'package:flutter_codelab_study/test/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Testing App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
