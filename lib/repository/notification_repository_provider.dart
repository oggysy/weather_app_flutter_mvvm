import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/datastore/provider/notification_datastore_provider.dart';
import 'package:weather_app_flutter_mvvm/repository/notification_repository.dart';
import 'package:weather_app_flutter_mvvm/repository/notification_repository_interface.dart';

final notificationRepositoryProvider =
    Provider<NotificationRepositoryInterface>(
  (ref) => NotificationRepository(
    dataStore: ref.read(
      notificationDataStoreProvider,
    ),
  ),
);
