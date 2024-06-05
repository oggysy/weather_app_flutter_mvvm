import 'package:timezone/timezone.dart';
import 'package:weather_app_flutter_mvvm/datastore/notification_datasotore_interface.dart';
import 'package:weather_app_flutter_mvvm/repository/notification_repository_interface.dart';

class NotificationRepository implements NotificationRepositoryInterface {
  final NotificationDataStoreInterface dataStore;
  NotificationRepository({required this.dataStore});

  @override
  void initializeNotifications() {
    dataStore.initializeNotifications();
  }

  @override
  void cancelAllNotifications() {
    dataStore.cancelAllNotifications();
  }

  @override
  Future<bool> checkNotificationPermissions() async {
    return dataStore.checkNotificationPermissions();
  }

  @override
  Future<bool> checkPendingNotifications() async {
    return dataStore.checkPendingNotifications();
  }

  @override
  Future<bool> scheduleDailyNotification({required TZDateTime time}) async {
    return dataStore.scheduleDailyNotification(time: time);
  }
}
