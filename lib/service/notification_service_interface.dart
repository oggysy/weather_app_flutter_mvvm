abstract class NotificationServiceInterface {
  void initializeNotifications();

  Future<bool> checkPendingNotifications();

  Future<bool> checkNotificationPermissions();

  Future<bool> scheduleDailyNotification({required DateTime time});

  Future<void> cancelAllNotifications();
}
