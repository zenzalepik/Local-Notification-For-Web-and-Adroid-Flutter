// lib/controllers/notification_controller.dart

import '../models/notification_model.dart';

class NotificationController {
  final NotificationModel notificationModel;

  NotificationController(this.notificationModel);

  void showNotification({
    required String title,
    required String body,
    String? channelId,
    String? channelName,
    String? channelDescription,
  }) {
    notificationModel.showNotification(
      title: title,
      body: body,
      channelId: channelId,
      channelName: channelName,
      channelDescription: channelDescription,
    );
  }
}
