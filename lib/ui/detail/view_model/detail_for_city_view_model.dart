import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app_flutter_mvvm/repository/weather_repository_provider.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_error_state.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/ui_state/detail_ui_state.dart';

part 'detail_for_city_view_model.g.dart';

@riverpod
class DetailForCityViewModel extends _$DetailForCityViewModel {
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
}
