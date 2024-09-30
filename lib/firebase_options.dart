import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("title: ${message.notification?.title}");
  debugPrint("title: ${message.notification?.body}");
  debugPrint("title: ${message.data}");
}

class FireApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  token() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        sound: true,
        badge: true,
        announcement: true,
        provisional: true);
    final fCMtoken = await _firebaseMessaging.getToken();
    await FirebaseMessaging.instance.setDeliveryMetricsExportToBigQuery(true);
    debugPrint('Token:  $fCMtoken');
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}
