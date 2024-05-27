import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sticky_headers/sticky_headers.dart';

class DetailPage extends StatelessWidget {
  final Map<String, List<String>> weather = const {
    '5月27日': [
      '天気情報1',
      '天気情報2',
    ],
    '5月28日': [
      '天気情報3',
      '天気情報4',
      '天気情報5',
      '天気情報6',
      '天気情報7',
      '天気情報8',
    ],
  };
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
              "東京都",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text('2024年5月13日'),
            const Text('降水確率'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 200.0,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: weather.length,
                itemBuilder: (context, index) {
                  String date = weather.keys.elementAt(index);
                  List<String> threeHourWethers = weather[date] ?? [];
                  return StickyHeader(
                    header: Container(
                      height: 30.0,
                      color: const Color.fromARGB(249, 244, 244, 244),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        date,
                      ),
                    ),
                    content: Column(
                      children: threeHourWethers
                          .map(
                            (event) => const _WeatherListCell(
                              maxTemperature: "30.0",
                              minTemperature: "20.0",
                              humidityLevel: "30",
                              imageName: "01",
                              time: "18:00",
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherListCell extends StatelessWidget {
  final String time;
  final String imageName;
  final String maxTemperature;
  final String minTemperature;
  final String humidityLevel;
  const _WeatherListCell({
    required this.maxTemperature,
    required this.minTemperature,
    required this.humidityLevel,
    required this.imageName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(time),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              'assets/images/splash_logo.png',
              width: 50,
              height: 50,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '最高気温:$maxTemperature ℃',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '最低気温:$minTemperature ℃',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
              const Gap(5),
              Text(
                '湿度:$humidityLevel %',
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
