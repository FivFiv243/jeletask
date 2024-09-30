import 'dart:async';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jeleapptask/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCei7KOnTCzu2FGu0LpyR-pJXj6LAVtIcI",
            appId: "1:864227434355:android:2912445ce4bcb4cb26af06",
            messagingSenderId: "864227434355",
            projectId: "jeleappstask"));
    await FireApi().initNotifications();
    runApp(const MyApp());
  } catch (e) {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void AnSi() async {
    try {
      FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      null;
    }
  }

  var mmmm;

  void qwe() async {
    mmmm = await FirebaseMessaging.instance.getToken();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {});
      qwe();
    });
    AnSi();
    qwe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(mmmm != null ? "$mmmm" : "cryin "),
          ],
        ),
      ),
    );
  }
}
