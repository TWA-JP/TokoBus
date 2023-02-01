import 'package:nholiday_jp/nholiday_jp.dart';

List timetables() {
  List Kotesashi_Campus_Weekdays = [
    [8, 00, "北口", "×"],
    [8, 05, "北口", "〇"],
    [8, 08, "北口", "×"],
    [8, 11, "北口", "×"],
    [8, 14, "北口", "×"],
    [8, 17, "北口", "×"],
    [8, 20, "北口", "×"],
    [8, 23, "北口", "×"],
    [8, 26, "北口", "×"],
    [8, 29, "北口", "×"],
    [8, 32, "北口", "×"],
    [8, 35, "北口", "×"],
    [8, 45, "北口", "×"],
    [8, 55, "北口", "×"],
    [9, 05, "北口", "×"],
    [9, 15, "北口", "×"],
    [9, 25, "北口", "×"],
    [9, 35, "北口", "×"],
    [9, 42, "北口", "〇"],
    [9, 45, "北口", "×"],
    [9, 48, "北口", "×"],
    [9, 51, "北口", "×"],
    [9, 55, "北口", "×"],
    [10, 02, "北口", "×"],
    [10, 05, "北口", "×"],
    [10, 08, "北口", "×"],
    [10, 11, "北口", "×"],
    [10, 14, "北口", "×"],
    [10, 17, "北口", "×"],
    [10, 20, "北口", "×"],
    [10, 25, "北口", "×"],
    [10, 35, "北口", "×"],
    [10, 50, "北口", "×"],
    [11, 05, "北口", "×"],
    [11, 20, "北口", "×"],
    [11, 35, "北口", "×"],
    [11, 45, "北口", "×"],
    [11, 55, "北口", "×"],
    [12, 05, "北口", "×"],
    [12, 10, "北口", "〇"],
    [12, 15, "北口", "×"],
    [12, 20, "北口", "×"],
    [12, 25, "北口", "×"],
    [12, 35, "北口", "×"],
    [12, 45, "北口", "×"],
    [12, 55, "北口", "×"],
    [13, 15, "北口", "〇"],
    [13, 25, "南口", "×"],
    [13, 35, "南口", "×"],
    [13, 45, "南口", "×"],
    [13, 50, "南口", "×"],
    [14, 00, "南口", "×"],
    [14, 05, "南口", "×"],
    [14, 10, "南口", "×"],
    [14, 15, "南口", "×"],
    [14, 20, "南口", "×"],
    [14, 25, "南口", "×"],
    [14, 35, "南口", "×"],
    [14, 45, "南口", "×"],
    [14, 55, "南口", "×"],
    [15, 05, "南口", "×"],
    [15, 15, "南口", "×"],
    [15, 40, "北口", "〇"],
    [15, 45, "南口", "×"],
    [16, 00, "南口", "×"],
    [16, 15, "南口", "×"],
    [16, 30, "南口", "×"],
    [16, 45, "南口", "×"],
    [16, 55, "南口", "×"],
    [17, 20, "北口", "〇"],
    [17, 45, "南口", "×"],
    [18, 15, "南口", "×"],
    [18, 45, "南口", "×"],
    [19, 20, "北口", "〇"],
    [19, 45, "南口", "×"],
    [20, 15, "南口", "×"]
  ];

  List Kotesashi_Campus_Saturdays = [
    [8, 10, "北口", "〇"],
    [8, 25, "北口", "×"],
    [8, 40, "北口", "×"],
    [9, 05, "北口", "×"],
    [9, 25, "北口", "×"],
    [9, 45, "北口", "×"],
    [10, 05, "北口", "〇"],
    [10, 25, "北口", "×"],
    [10, 55, "北口", "×"],
    [11, 25, "北口", "×"],
    [11, 55, "北口", "〇"],
    [12, 15, "南口", "×"],
    [12, 35, "南口", "×"],
    [12, 55, "南口", "×"],
    [13, 15, "南口", "×"],
    [13, 35, "北口", "〇"],
    [13, 55, "南口", "×"],
    [14, 15, "南口", "×"],
    [14, 35, "南口", "×"],
    [14, 55, "南口", "×"],
    [15, 15, "南口", "×"],
    [15, 50, "北口", "〇"],
    [16, 05, "南口", "×"],
    [16, 50, "南口", "×"],
    [17, 25, "北口", "〇"],
    [17, 45, "南口", "×"],
    [18, 15, "南口", "×"],
    [19, 15, "南口", "×"],
    [20, 15, "南口", "×"],
  ];

  List Kotesashi_Campus_SundaysHolidays = [
    [8, 15, "北口", "×"],
    [8, 55, "北口", "×"],
    [9, 45, "北口", "×"],
    [11, 25, "北口", "×"],
    [12, 15, "南口", "×"],
    [12, 55, "南口", "×"],
    [14, 45, "南口", "×"],
    [15, 45, "南口", "×"],
    [16, 45, "南口", "×"],
    [17, 25, "南口", "×"],
    [18, 15, "南口", "×"],
    [19, 45, "南口", "×"],
  ];

  List Campus_Kotesashi_Weekdays = [
    [8, 55, "北口", "×"],
    [9, 45, "北口", "×"],
    [10, 30, "北口", "×"],
    [10, 45, "北口", "×"],
    [11, 15, "北口", "×"],
    [11, 40, "北口", "〇"],
    [12, 00, "北口", "×"],
    [12, 05, "北口", "×"],
    [12, 15, "北口", "×"],
    [12, 20, "北口", "×"],
    [12, 35, "北口", "×"],
    [12, 45, "北口", "〇"],
    [13, 10, "南口", "×"],
    [13, 20, "南口", "×"],
    [13, 35, "南口", "×"],
    [13, 40, "南口", "×"],
    [13, 55, "南口", "×"],
    [14, 00, "南口", "×"],
    [14, 05, "南口", "×"],
    [14, 15, "南口", "×"],
    [14, 25, "南口", "×"],
    [14, 30, "南口", "×"],
    [14, 35, "南口", "×"],
    [14, 40, "南口", "×"],
    [14, 45, "南口", "×"],
    [14, 50, "南口", "×"],
    [14, 55, "南口", "×"],
    [15, 00, "南口", "×"],
    [15, 10, "北口", "〇"],
    [15, 30, "南口", "×"],
    [15, 45, "南口", "×"],
    [15, 55, "南口", "×"],
    [16, 00, "南口", "×"],
    [16, 05, "南口", "×"],
    [16, 10, "南口", "×"],
    [16, 15, "南口", "×"],
    [16, 20, "南口", "×"],
    [16, 25, "南口", "×"],
    [16, 30, "南口", "×"],
    [16, 35, "南口", "×"],
    [16, 40, "南口", "×"],
    [16, 50, "北口", "×"],
    [17, 00, "南口", "×"],
    [17, 10, "南口", "×"],
    [17, 20, "南口", "×"],
    [17, 30, "南口", "×"],
    [17, 40, "南口", "×"],
    [17, 50, "南口", "×"],
    [17, 55, "南口", "×"],
    [18, 00, "南口", "×"],
    [18, 05, "南口", "×"],
    [18, 10, "南口", "×"],
    [18, 15, "南口", "×"],
    [18, 20, "南口", "×"],
    [18, 25, "南口", "×"],
    [18, 30, "南口", "×"],
    [18, 40, "南口", "×"],
    [18, 50, "北口", "〇"],
    [19, 00, "南口", "×"],
    [19, 10, "南口", "×"],
    [19, 20, "南口", "×"],
    [19, 30, "南口", "×"],
    [19, 35, "南口", "×"],
    [19, 40, "南口", "×"],
    [19, 45, "南口", "×"],
    [19, 50, "南口", "×"],
    [19, 55, "南口", "×"],
    [20, 00, "南口", "×"],
    [20, 05, "南口", "×"],
    [20, 10, "南口", "×"],
    [20, 15, "南口", "×"],
    [20, 20, "南口", "×"],
    [20, 25, "南口", "×"],
    [20, 30, "北口", "〇"],
    [20, 45, "南口", "×"],
    [21, 00, "南口", "×"],
    [21, 20, "南口", "×"],
    [21, 40, "南口", "×"],
  ];

  List Campus_Kotesashi_Saturdays = [
    [8, 45, "北口", "×"],
    [9, 35, "北口", "×"],
    [10, 05, "北口", "×"],
    [10, 35, "北口", "×"],
    [11, 05, "北口", "×"],
    [11, 25, "北口", "○"],
    [12, 00, "南口", "×"],
    [12, 20, "南口", "×"],
    [12, 40, "南口", "×"],
    [13, 00, "南口", "×"],
    [13, 05, "北口", "○"],
    [13, 40, "南口", "×"],
    [14, 00, "南口", "×"],
    [14, 20, "南口", "×"],
    [14, 40, "南口", "×"],
    [15, 00, "南口", "×"],
    [15, 20, "北口", "○"],
    [15, 50, "南口", "×"],
    [16, 15, "南口", "×"],
    [16, 35, "南口", "×"],
    [16, 55, "北口", "○"],
    [17, 15, "南口", "×"],
    [17, 30, "南口", "×"],
    [17, 45, "南口", "×"],
    [18, 00, "南口", "×"],
    [18, 20, "北口", "○"],
    [18, 40, "南口", "×"],
    [19, 00, "南口", "×"],
    [19, 30, "南口", "×"],
    [20, 00, "南口", "×"],
    [20, 40, "南口", "×"],
    [21, 40, "南口", "×"],
  ];

  List Campus_Kotesashi_SundaysHolidays = [
    [8, 35, "北口", "×"],
    [9, 25, "北口", "×"],
    [11, 05, "北口", "×"],
    [12, 00, "南口", "×"],
    [12, 40, "南口", "×"],
    [14, 30, "南口", "×"],
    [15, 30, "南口", "×"],
    [16, 30, "南口", "×"],
    [17, 10, "南口", "×"],
    [18, 00, "南口", "×"],
    [19, 30, "南口", "×"],
    [21, 00, "南口", "×"],
  ];

  List Campus_FRC_Weekdays = [
    [8, 25, "正門", "×"],
    [8, 40, "正門", "×"],
    [8, 50, "南門", "×"],
    [9, 10, "正門", "×"],
    [9, 20, "南門", "×"],
    [9, 50, "正門", "×"],
    [10, 15, "南門", "×"],
    [10, 25, "正門", "×"],
    [10, 36, "南門", "×"],
    [10, 45, "南門", "×"],
    [11, 55, "正門", "×"],
    [12, 15, "南門", "×"],
    [12, 25, "南門", "×"],
    [12, 35, "正門", "×"],
    [12, 45, "南門", "×"],
    [12, 55, "南門", "×"],
    [13, 20, "正門", "×"],
    [13, 50, "南門", "×"],
    [14, 00, "正門", "×"],
    [14, 25, "正門", "×"],
    [14, 36, "南門", "×"],
    [14, 45, "南門", "×"],
    [15, 25, "正門", "×"],
    [15, 55, "正門", "×"],
    [16, 10, "正門", "×"],
    [16, 21, "南門", "×"],
    [16, 30, "南門", "×"],
    [16, 50, "正門", "×"],
    [17, 10, "南門", "×"],
    [17, 30, "正門", "×"],
    [17, 55, "正門", "×"],
    [18, 06, "南門", "×"],
    [18, 15, "南門", "×"],
    [18, 25, "正門", "×"],
    [19, 40, "正門", "×"],
    [19, 50, "南門", "×"],
    [20, 10, "正門", "×"],
  ];

  List Campus_FRC_Saturdays = [
    [8, 35, "正門", "×"],
    [8, 50, "南門", "×"],
    [9, 10, "正門", "×"],
    [9, 20, "南門", "×"],
    [10, 15, "南門", "×"],
    [10, 30, "正門", "×"],
    [10, 50, "南門", "×"],
    [12, 10, "正門", "×"],
    [12, 20, "南門", "×"],
    [12, 30, "正門", "×"],
    [12, 45, "南門", "×"],
    [12, 55, "南門", "×"],
    [14, 25, "正門", "×"],
    [14, 35, "南門", "×"],
    [14, 45, "南門", "×"],
    [16, 00, "正門", "×"],
    [16, 20, "南門", "×"],
    [16, 40, "南門", "×"],
    [17, 55, "正門", "×"],
    [18, 05, "南門", "×"],
    [18, 25, "南門", "×"],
    [19, 35, "正門", "×"],
    [19, 50, "南門", "×"],
    [20, 00, "正門", "×"],
    [20, 25, "南門", "×"],
  ];

  List FRC_Campus_Weekdays = [
    [8, 45, "南門", "×"],
    [8, 55, "正門", "×"],
    [9, 15, "南門", "×"],
    [9, 25, "正門", "×"],
    [9, 55, "南門", "×"],
    [10, 20, "正門", "〇"],
    [10, 32, "南門", "×"],
    [10, 40, "南門", "×"],
    [10, 50, "正門", "×"],
    [12, 00, "南門", "×"],
    [12, 20, "南門", "×"],
    [12, 30, "正門", "〇"],
    [12, 40, "南門", "×"],
    [12, 50, "南門", "×"],
    [13, 00, "正門", "〇"],
    [13, 25, "南門", "×"],
    [13, 55, "正門", "〇"],
    [14, 20, "正門", "〇"],
    [14, 32, "南門", "×"],
    [14, 40, "南門", "×"],
    [14, 50, "正門", "〇"],
    [15, 30, "南門", "×"],
    [16, 00, "正門", "〇"],
    [16, 17, "南門", "×"],
    [16, 25, "南門", "×"],
    [16, 35, "正門", "〇"],
    [16, 55, "南門", "×"],
    [17, 15, "正門", "〇"],
    [17, 40, "正門", "〇"],
    [18, 02, "南門", "×"],
    [18, 10, "南門", "×"],
    [18, 20, "正門", "〇"],
    [18, 35, "正門", "〇"],
    [19, 45, "南門", "×"],
    [19, 55, "正門", "〇"],
    [20, 15, "正門", "〇"],
    [20, 55, "正門", "〇"],
    [21, 10, "正門", "〇"],
    [21, 30, "正門", "〇"],
  ];

  List FRC_Campus_Saturdays = [
    [8, 40, "南門", "×"],
    [8, 55, "正門", "×"],
    [9, 15, "南門", "×"],
    [9, 25, "正門", "〇"],
    [10, 20, "正門", "〇"],
    [10, 35, "南門", "×"],
    [10, 55, "正門", "〇"],
    [12, 15, "南門", "×"],
    [12, 25, "正門", "×"],
    [12, 35, "南門", "×"],
    [12, 50, "南門", "×"],
    [13, 00, "正門", "〇"],
    [14, 30, "南門", "×"],
    [14, 40, "南門", "×"],
    [14, 50, "正門", "〇"],
    [16, 05, "南門", "×"],
    [16, 35, "南門", "×"],
    [16, 45, "正門", "〇"],
    [17, 15, "正門", "〇"],
    [18, 00, "南門", "×"],
    [18, 10, "南門", "×"],
    [18, 30, "正門", "〇"],
    [19, 45, "南門", "×"],
    [19, 55, "正門", "〇"],
    [20, 05, "南門", "×"],
    [20, 30, "正門", "〇"],
  ];

  List timetable = [];
  var dt = DateTime.now();
  var holidaysOfMonth = NHolidayJp.getByMonth(dt.year, dt.month);
  List dateOfHolidaysOfMonth = [];
  for (int i = 0; i < holidaysOfMonth.length; i++) {
    dateOfHolidaysOfMonth.add(holidaysOfMonth[i].date);
  }

  if (dt.weekday == 7 || dateOfHolidaysOfMonth.contains(1) == true) {
    //日曜日か祝日
    timetable.add(Kotesashi_Campus_SundaysHolidays);
    timetable.add(Campus_Kotesashi_SundaysHolidays);
  } else if (dt.weekday >= 1 && dt.weekday <= 5) {
    //平日
    timetable.add(Kotesashi_Campus_Weekdays);
    timetable.add(Campus_Kotesashi_Weekdays);
    timetable.add(Campus_FRC_Weekdays);
    timetable.add(FRC_Campus_Weekdays);
  } else {
    //土曜日
    timetable.add(Kotesashi_Campus_Saturdays);
    timetable.add(Campus_Kotesashi_Saturdays);
    timetable.add(Campus_FRC_Saturdays);
    timetable.add(FRC_Campus_Saturdays);
  }
  return timetable;
}
