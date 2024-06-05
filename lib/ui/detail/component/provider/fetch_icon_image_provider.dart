import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_provider.dart';

final fetchIconImageProvider = FutureProvider.family<Uint8List, String>((
  ref,
  iconName,
) async {
  try {
    final response = await ref
        .read(weatherRepositoryProvider)
        .fetchIconImage(iconName: iconName);
    return response;
  } catch (e) {
    throw Exception(e);
  }
});
