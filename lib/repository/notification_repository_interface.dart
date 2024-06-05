import 'package:timezone/timezone.dart' as tz;

abstract class NotificationRepositoryInterface {
  void initializeNotifications();

  Future<bool> checkPendingNotifications();

  Future<bool> checkNotificationPermissions();

  Future<bool> scheduleDailyNotification({required tz.TZDateTime time});

  void cancelAllNotifications();
}
