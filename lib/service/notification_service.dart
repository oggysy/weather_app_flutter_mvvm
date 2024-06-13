import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:weather_app_flutter_mvvm/extension/date_time_extension.dart';
import 'package:weather_app_flutter_mvvm/service/notification_service_interface.dart';

class NotificationService implements NotificationServiceInterface {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  NotificationService({required this.flutterLocalNotificationsPlugin});

  @override
  void initializeNotifications() async {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestNotificationsPermission();
  }

  @override
  Future<bool> checkPendingNotifications() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    if (pendingNotificationRequests.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<bool> checkNotificationPermissions() async {
    final bool? androidPermissionsGranted =
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission();
    return androidPermissionsGranted ?? false;
  }

  @override
  Future<bool> scheduleDailyNotification({required DateTime time}) async {
    try {
      final tz = time.toTZDateTime();
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        '今日の天気を確認',
        '通知をタップして今日の天気を確認',
        tz,
        const NotificationDetails(
          iOS: DarwinNotificationDetails(
            badgeNumber: 1,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
