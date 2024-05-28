import 'package:weather_app_flutter_mvvm/extension/date_time_extension.dart';

extension TimeStampExtension on int {
  String toStringHHMMFromEpoch() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return date.dateAsStringHHMM;
  }

  String toStringMMDDFromEpoch() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return date.dateAsStringMMDD;
  }
}
