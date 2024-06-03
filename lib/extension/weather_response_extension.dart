import 'package:weather_app_flutter_mvvm/extension/date_time_extension.dart';
import 'package:weather_app_flutter_mvvm/extension/int_extension.dart';
import 'package:weather_app_flutter_mvvm/model/response/weathre_response_model.dart';

extension WeatherResponseModelExtension on WeatherResponseModel {
  List<Map<String, int>> get timeAndPopList {
    return list.map((data) {
      String time =
          DateTime.fromMillisecondsSinceEpoch(data.dt * 1000).asStringHHMM;
      int popPercent = (data.pop.isNaN || data.pop.isInfinite)
          ? 0
          : (data.pop * 100).toInt();
      return {time: popPercent};
    }).toList();
  }

  Map<String, List<WeatherData>> groupByDate() {
    Map<String, List<WeatherData>> grouped = {};
    for (var data in list) {
      String formattedDate = data.dt.toStringMMDDFromEpoch();
      if (!grouped.containsKey(formattedDate)) {
        grouped[formattedDate] = [];
      }
      grouped[formattedDate]?.add(data);
    }
    return grouped;
  }
}
