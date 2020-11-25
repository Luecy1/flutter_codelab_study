import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<QuerySnapshot> _currentSubscription;

  _HomePageState() {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
