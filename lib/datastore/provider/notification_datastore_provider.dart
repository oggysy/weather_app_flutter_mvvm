import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/datastore/notification_datasotore_interface.dart';
import 'package:weather_app_flutter_mvvm/datastore/notification_datastore.dart';

final notificationDataStoreProvider = Provider<NotificationDataStoreInterface>(
  (ref) => NotificationDataStore(
    flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
  ),
);
