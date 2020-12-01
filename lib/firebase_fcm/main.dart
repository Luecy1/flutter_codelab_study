// respect https://note.com/welchi/n/n649728c5574d
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

main() async {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: MyPage(),
    ),
  ));
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    initNotification();
  }
}

FirebaseMessaging _firebaseMessaging;

Future<void> initNotification() async {
  _firebaseMessaging = FirebaseMessaging()
    ..requestNotificationPermissions()
    ..onIosSettingsRegistered.listen((settings) {})
    ..configure(
      onMessage: (Map<String, dynamic> message) async {},
      onBackgroundMessage: myBackgroundMessageHandler, // for android only
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch :$message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume :$message');
      },
    );
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (!Platform.isAndroid) {
    return;
  }

  if (message.containsKey('data')) {
    final data = message['data'];
  }

  if (message.containsKey('notification')) {
    final notification = message['notification'];
  }

  print('onBackground :$message');
}
