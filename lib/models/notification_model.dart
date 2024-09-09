// lib/models/notification_model.dart

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:html' as html;

class NotificationModel {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationModel() {
    if (!isWeb()) {
      initializeLocalNotifications();
    }
  }

  bool isWeb() {
    return html.window != null;
  }

  void initializeLocalNotifications() {
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    required String channelId,
    required String channelName,
    required String channelDescription,
  }) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,
    );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  void showWebNotification({
    required String title,
    required String body,
  }) {
    html.Notification(title, body: body);
  }

  void requestWebNotificationPermission({
    required String title,
    required String body,
  }) {
    html.Notification.requestPermission().then((permission) {
      if (permission == 'granted') {
        showWebNotification(title: title, body: body);
      }
    });
  }

  void showNotification({
    required String title,
    required String body,
    String? channelId,
    String? channelName,
    String? channelDescription,
  }) {
    if (isWeb()) {
      requestWebNotificationPermission(
        title: title,
        body: body,
      );
    } else {
      showLocalNotification(
        title: title,
        body: body,
        channelId: channelId ?? 'default_channel_id',
        channelName: channelName ?? 'default_channel_name',
        channelDescription: channelDescription ?? 'default_channel_description',
      );
    }
  }
}
