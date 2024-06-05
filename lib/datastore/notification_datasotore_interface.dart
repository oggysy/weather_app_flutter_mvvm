import 'package:timezone/timezone.dart' as tz;

abstract class NotificationDataStoreInterface {
  void initializeNotifications();

  Future<bool> checkPendingNotifications();

  Future<bool> checkNotificationPermissions();

  Future<bool> scheduleDailyNotification({required tz.TZDateTime time});

  Future<void> cancelAllNotifications();
}
