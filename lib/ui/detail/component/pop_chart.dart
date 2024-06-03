import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PopChart extends StatelessWidget {
  const PopChart({
    super.key,
    required this.timePopData,
  });

  final List<Map<String, int>> timePopData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [LineChartBarData(spots: _setupSpots())],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                if (index >= 0 && index < timePopData.length) {
                  return Text(
                    timePopData[index].keys.first,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}',
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
        ),
        maxY: 100,
        minY: 0,
      ),
    );
  }

  List<FlSpot> _setupSpots() {
    List<FlSpot> spots = [];
    for (var i = 0; i < timePopData.length; i++) {
      double x = i.toDouble();
      double y = timePopData[i].values.first.toDouble();
      spots.add(FlSpot(x, y));
    }
    return spots;
  }
}
