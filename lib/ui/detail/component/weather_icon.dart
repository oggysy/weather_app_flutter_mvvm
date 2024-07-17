import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/component/provider/fetch_icon_image_provider.dart';

class WeathreIcon extends ConsumerWidget {
  const WeathreIcon(this.iconName, {super.key});

  final String iconName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(fetchIconImageProvider(iconName));
    return image.maybeWhen(
      orElse: () {
        return const SizedBox(
          width: 50,
          height: 50,
        );
      },
      data: (data) {
        return Image.memory(
          data,
          width: 50,
          height: 50,
        );
      },
    );
  }
}
