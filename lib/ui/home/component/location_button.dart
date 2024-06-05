import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app_flutter_mvvm/repository/location_repository_provider.dart';
import 'package:weather_app_flutter_mvvm/ui/componet/setting_transition_alert.dart';
import 'package:weather_app_flutter_mvvm/ui/detail/view/detail_for_location_page.dart';

class LocationButton extends HookConsumerWidget {
  const LocationButton({super.key});

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return const SettingTransitionAlertDialog(
          title: "位置情報が許可されていません",
          message: "設定から位置情報を許可してください",
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () async {
        final isActiveLocation =
            await ref.read(locationrRepositoryProvider).requestPermission();
        if (!context.mounted) return;
        if (!isActiveLocation) {
          showErrorDialog(context);
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailForLocationPage(),
          ),
        );
      },
      icon: const Icon(
        Icons.near_me,
      ),
      label: const Text(
        '現在地を取得',
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: const TextStyle(
          fontSize: 16,
        ),
        fixedSize: const Size(
          190,
          double.infinity,
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
