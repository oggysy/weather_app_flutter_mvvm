import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_app_flutter_mvvm/datastore/notification_datasotore_interface.dart';

class NotificationDataStore implements NotificationDataStoreInterface {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  NotificationDataStore({required this.flutterLocalNotificationsPlugin});

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
  Future<bool> scheduleDailyNotification({required tz.TZDateTime time}) async {
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        '今日の天気を確認',
        '通知をタップして今日の天気を確認',
        time,
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
