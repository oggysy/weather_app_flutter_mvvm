import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/detail_page_contents.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/view_model/detail_for_location_view_model.dart';

class DetailForLocationPage extends ConsumerWidget {
  const DetailForLocationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(detailForLocationViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: DetailPageContent(
        uiState: viewModel,
      ),
    );
  }
}
