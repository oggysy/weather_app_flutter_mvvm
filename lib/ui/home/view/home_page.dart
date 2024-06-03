import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app_flutter_mvvm/ui/prefecture/view/prefecture_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
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
            ),
            const Gap(20),
            ElevatedButton.icon(
              onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
