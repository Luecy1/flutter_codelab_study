// https://codelabs.developers.google.com/codelabs/flutter-app-testing/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/favorites.dart';
import 'screens/FavoritesPage.dart';
import 'screens/home.dart';

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
