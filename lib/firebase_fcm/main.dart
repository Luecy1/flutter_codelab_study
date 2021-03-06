// respect https://note.com/welchi/n/n649728c5574d
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

main() {
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
    return FutureBuilder<String>(
      future: getToken(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          return Text(snapshot.data);
        }
        return Container();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initNotification();
  }
}

Future<String> getToken() async {
  var token = await _firebaseMessaging.getToken();
  return token;
}

FirebaseMessaging _firebaseMessaging;

Future<void> initNotification() async {
  _firebaseMessaging = FirebaseMessaging()
    ..requestNotificationPermissions()
    ..onIosSettingsRegistered.listen((settings) {})
    ..configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onBackgroundMessage: myBackgroundMessageHandler, // for android only
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch :$message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume :$message');
      },
    );

  _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true));
  _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
    debugPrint('Settings registered: $setting');
  });
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (!Platform.isAndroid) {
    return;
  }

  if (message.containsKey('data')) {
    final dynamic data = message['data'];
    print(data);
  }

  if (message.containsKey('notification')) {
    final dynamic notification = message['notification'];
    print(notification);
  }

  print('onBackground :$message');
}
