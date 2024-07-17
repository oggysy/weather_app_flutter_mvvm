import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

extension DateTimeExtension on DateTime {
  String get asStringYMD {
    return DateFormat('y年M月d日').format(this);
  }

  String get asStringMMDD {
    return DateFormat('MM月dd日').format(this);
  }

  String get asStringHHMM {
    return DateFormat('HH:mm').format(this);
  }

  tz.TZDateTime toTZDateTime() {
    final location = tz.getLocation('Asia/Tokyo');
    return tz.TZDateTime.from(this, location);
  }
}
