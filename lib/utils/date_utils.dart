import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getDateFormat(String dateTimeIsoString) {
    final dateTime = DateTime.tryParse(dateTimeIsoString);

    if (dateTime == null) return "";

    final format = DateFormat("d MMM, y").format(dateTime);

    return format;
  }
}
