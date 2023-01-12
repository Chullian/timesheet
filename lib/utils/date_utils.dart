import 'package:intl/intl.dart';

class DateTimeUtils {
  static String timeStampToString(int timeStamp) {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    String dateOnly = DateFormat('dd/MM/yyyy').format(dateTime);

    return dateOnly;
  }
}
