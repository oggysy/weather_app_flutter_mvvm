import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_provider.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_error_state.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_ui_state.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  @override
  AsyncValue<DetailUiState> build() {
    return const AsyncLoading<DetailUiState>();
  }

  Future<void> fetchWeatherByCity(
    String city,
  ) async {
    state = const AsyncLoading();
    try {
      final response =
          await ref.read(weatherRepositoryProvider).fetchWeatherByCity(
                city: city,
              );
      final uiState = DetailUiState.fromWeatherResponse(response);
      state = AsyncValue.data(uiState);
    } catch (error, stackTrace) {
      final errorMessage = error.toString().replaceFirst(
            'Exception: ',
            '',
          );
      ref.read(detailErrorStateProvider.notifier).state = errorMessage;
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> fetchWeatherByLocation({
    required double lat,
    required double lon,
  }) async {
    state = const AsyncLoading();
    try {
      final response =
          await ref.read(weatherRepositoryProvider).fetchWeatherByLocation(
                lat: lat,
                lon: lon,
              );
      final uiState = DetailUiState.fromWeatherResponse(response);
      state = AsyncValue.data(uiState);
    } catch (error, stackTrace) {
      final errorMessage = error.toString().replaceFirst(
            'Exception: ',
            '',
          );
      ref.read(detailErrorStateProvider.notifier).state = errorMessage;
      state = AsyncError(error, stackTrace);
    }
  }

  Future<Uint8List> fetchIconImage({
    required String iconName,
  }) async {
    try {
      final response = await ref
          .read(weatherRepositoryProvider)
          .fetchIconImage(iconName: iconName);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
