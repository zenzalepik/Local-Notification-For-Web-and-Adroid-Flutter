// lib/main.dart

import 'package:flutter/material.dart';
import 'models/notification_model.dart';
import 'controllers/notification_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late NotificationController notificationController;

  @override
  void initState() {
    super.initState();
    final notificationModel = NotificationModel();
    notificationController = NotificationController(notificationModel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Local & Web Notifications'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  notificationController.showNotification(
                    title: 'Notification 1',
                    body: 'This is the first notification!',
                    channelId: 'channel_1',
                    channelName: 'Channel 1',
                    channelDescription: 'Description for Channel 1',
                  );
                },
                child: Text('Show Notification 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  notificationController.showNotification(
                    title: 'Notification 2',
                    body: 'This is the second notification!',
                    channelId: 'channel_2',
                    channelName: 'Channel 2',
                    channelDescription: 'Description for Channel 2',
                  );
                },
                child: Text('Show Notification 2'),
              ),
              // Tambahkan tombol untuk notifikasi lainnya sesuai kebutuhan
            ],
          ),
        ),
      ),
    );
  }
}
