class DateTimeUtils {
  /// Convert the given [dateTime] to the format `2 NOV 2020`.
  static String formateDate(DateTime dateTime) {
    String format = "";
    if (dateTime != null) {
      format =
          "${dateTime.day.toString()} ${abbrevMonthsName(dateTime.month)} ${dateTime.year.toString()}";
    }
    return format;
  }

  static String abbrevMonthsName(int month) =>
      _ABBREVIATED_MONTHS_FULL_NAMES[month];

  static String fullMonthsName(int month) => _FULL_MONTHS_FULL_NAMES[int];

  static const Map<int, String> _ABBREVIATED_MONTHS_FULL_NAMES = {
    DateTime.january: "JAN",
    DateTime.february: "FEB",
    DateTime.march: "MAR",
    DateTime.april: "APR",
    DateTime.may: "MAY",
    DateTime.june: "JUN",
    DateTime.july: "JUL",
    DateTime.august: "AUG",
    DateTime.september: "SEP",
    DateTime.october: "OCT",
    DateTime.november: "NOV",
    DateTime.december: "DEC"
  };

  static const Map<int, String> _FULL_MONTHS_FULL_NAMES = {
    DateTime.january: "January",
    DateTime.february: "February",
    DateTime.march: "March",
    DateTime.april: "April",
    DateTime.may: "May",
    DateTime.june: "June",
    DateTime.july: "July",
    DateTime.august: "August",
    DateTime.september: "September",
    DateTime.october: "October",
    DateTime.november: "November",
    DateTime.december: "December"
  };
}
