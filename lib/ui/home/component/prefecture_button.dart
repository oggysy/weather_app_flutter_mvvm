import 'package:flutter/material.dart';
import 'package:weather_app_flutter_mvvm/ui/prefecture/view/prefecture_page.dart';

class PrefectureButton extends StatelessWidget {
  const PrefectureButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PrefecturePage(),
          ),
        );
      },
      icon: const Icon(Icons.format_list_bulleted),
      label: const Text('都道府県を選択'),
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
