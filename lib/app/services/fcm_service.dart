import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sabi_vendor_hub_mobile/app/services/notification_service.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/fcm_message_handler.dart';

import '../utils/app_logger.dart';

class FCMService {
  static String? fcmToken;

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    sound: RawResourceAndroidNotificationSound('bell'),
  );

  static Future<void> init() async {
   /*  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
 */
    await initPushNotifications();
    await initLocalNotifications();
  }

  static Future<void> initPushNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();

    await FirebaseMessaging.instance
        .requestPermission(
      sound: true,
      badge: true,
      alert: true,
      announcement: true,
      criticalAlert: true,
    )
        .then((NotificationSettings settings) {
      appLog('User granted permission: ${settings.authorizationStatus}');
    }).catchError((error) {
      // UiService().showInfoDialog(content: Column());
      appLog('Error requesting permission: $error');
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    //the  below line is for when the app is in background and notification is clicked

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await flutterLocalNotificationsPlugin.cancelAll();

      final notification = message.notification;

      //generate a unique id for each notification
      int id = DateTime.now().millisecondsSinceEpoch;

      if (notification != null) {
        appLog('message received', notification.body.toString());
        await showNotification(
          title: notification.title ?? "",
          message: notification.body ?? "",
          id: id,
        );
      }
    });

    if (Platform.isIOS) {
      fcmToken = await FirebaseMessaging.instance.getToken();
    } else {
      fcmToken = await FirebaseMessaging.instance.getToken();
    }

    debugPrint("Your FCM Token is: $fcmToken");
  }

  static Future<void> handleMessage(RemoteMessage? message) async {
    // Handle incoming FCM messages here if needed
    if (message != null) {
      FcmMessageHandler().handle(message.data);
    }
  }

  static Future<void> initLocalNotifications() async {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: (res) async {
        appLog("notification received", res);
      },
    );
    final androidPlatform =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    await androidPlatform?.createNotificationChannel(channel);
  }

  static const sound = '.wav';

  static Future<void> cancelNotification(id) async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> showNotification({
    required String title,
    required String message,
    required int id,
    Map<String, dynamic>? payload,
    autoCancel = true,
    ongoing = false,
  }) async {
    appLog("showing notification");
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      message,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.max,
          autoCancel: autoCancel,
          priority: Priority.max,
          ongoing: ongoing,
          playSound: true,
          enableVibration: true,
          enableLights: true,
          visibility: NotificationVisibility.public,
          color: Get.theme.colorScheme.primary,
          channelShowBadge: true,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          presentBanner: true,
        ),
      ),
      payload: json.encode(payload.toString()),
    );
    NotificationService.addNotification(
      title: title,
      message: message,
      payLoad: json.encode(payload),
    );
  }
}