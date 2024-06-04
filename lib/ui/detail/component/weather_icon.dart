import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/view_model/detail_view_model.dart';

class WeathreIcon extends ConsumerWidget {
  const WeathreIcon(this.iconName, {super.key});

  final String iconName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref
        .watch(detailViewModelProvider.notifier)
        .fetchIconImage(iconName: iconName);
    return FutureBuilder(
      future: image,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Image.memory(
            snapshot.data,
            width: 50,
            height: 50,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 50,
            height: 50,
          );
        } else {
          return const Text('No data');
        }
      },
    );
  }
}
