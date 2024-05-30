import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_provider.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_ui_state.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  @override
  FutureOr<DetailUiState?> build() {
    return Future<DetailUiState?>.value(null);
  }

  Future<void> fetchWeatherByCity(
    String city,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final response =
            await ref.read(weatherRepositoryProvider).fetchWeatherByCity(
                  city: city,
                );
        final uiState = DetailUiState.fromWeatherResponse(response);
        return uiState;
      },
    );
  }

  Future<void> fetchWeatherByLocation({
    required double lat,
    required double lon,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final response =
            await ref.read(weatherRepositoryProvider).fetchWeatherByLocation(
                  lat: lat,
                  lon: lon,
                );
        final uiState = DetailUiState.fromWeatherResponse(response);
        return uiState;
      },
    );
  }
}
