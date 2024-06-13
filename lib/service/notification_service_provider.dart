import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/service/notification_service.dart';

final notificationDataStoreProvider = Provider<NotificationService>(
  (ref) => NotificationService(
    flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
  ),
);
