import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_flutter_mvvm/repository/location_repository_provider.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_provider.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_error_state.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_ui_state.dart';

part 'detail_for_location_view_model.g.dart';

@riverpod
class DetailForLocationViewModel extends _$DetailForLocationViewModel {
  @override
  Future<DetailUiState> build() async {
    return fetchWeatherByLocation();
  }

  Future<DetailUiState> fetchWeatherByLocation() async {
    try {
      final location =
          await ref.read(locationrRepositoryProvider).getCurrentLocation();
      final response =
          await ref.read(weatherRepositoryProvider).fetchWeatherByLocation(
                lat: location.latitude,
                lon: location.longitude,
              );
      final uiState = DetailUiState.fromWeatherResponse(response);
      return uiState;
    } catch (error) {
      final errorMessage = error.toString().replaceFirst(
            'Exception: ',
            '',
          );
      ref.read(detailErrorStateProvider.notifier).state = errorMessage;
      throw Exception(error);
    }
  }
}
