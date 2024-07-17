import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/detail_page_contents.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/view_model/detail_for_city_view_model.dart';

class DetailForCityPage extends HookConsumerWidget {
  const DetailForCityPage(this.prefecture, {super.key});

  final String prefecture;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ref
              .read(detailForCityViewModelProvider.notifier)
              .fetchWeatherByCity(prefecture);
        },
      );
      return null;
    }, const []);
    final viewModel = ref.watch(detailForCityViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: DetailPageContent(
        uiState: viewModel,
      ),
    );
  }
}
