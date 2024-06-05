import 'package:intl/intl.dart';

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
}
