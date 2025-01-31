import 'package:nholiday_jp/nholiday_jp.dart';
import 'timetable_provider_1_semester.dart';
import 'timetable_provider_2_summer_vacation.dart';
import 'timetable_provider_3_winter_vacation.dart';
import 'timetable_provider_4_spring_vacation.dart';
import 'holiday_config.dart';

Map timetableProvider() {
  DateTime now = DateTime.now();

  // 時刻表をリストとして定義
  List<Map> timetables = [
    timetableDataSemester(),
    timetableDataSummerVacation(),
    timetableDataWinterVacation(),
    timetableDataSpringVacation(),
  ];

  // 'startDate'でソート（降順：最新の'startDate'が先頭になる）
  timetables.sort((a, b) => b['startDate'].compareTo(a['startDate']));

  Map timetable = {};
  // 現在の時刻に合う時刻表を選択
  for (final tt in timetables) {
    if (now.isAfter(tt['startDate'])) {
      timetable = tt;
      break;
    }
  }

  List<DateTime> holidays = NHolidayJp.getByYear(now.year).map((holiday) => DateTime(now.year, holiday.month, holiday.date)).toList();

  if (now.weekday == DateTime.sunday || holidays.contains(DateTime(now.year, now.month, now.day))) {
    // 日曜日か祝日
    timetable['tableInfo']['selectedTableNames'].add('stationCampusSundaysHolidays');
    timetable['tableInfo']['selectedTableNames'].add('campusStationSundaysHolidays');
    timetable['tableInfo']['selectedTableNames'].add('');
    timetable['tableInfo']['selectedTableNames'].add('');
    timetable['tableInfo']['dayOfWeek'] = '日曜日/祝日ダイヤ';
  } else if (now.weekday >= DateTime.monday && now.weekday <= DateTime.friday) {
    // 平日
    timetable['tableInfo']['selectedTableNames'].add('stationCampusWeekdays');
    timetable['tableInfo']['selectedTableNames'].add('campusStationWeekdays');
    timetable['tableInfo']['selectedTableNames'].add('campusFRCWeekdays');
    timetable['tableInfo']['selectedTableNames'].add('frcCampusWeekdays');
    timetable['tableInfo']['dayOfWeek'] = '平日ダイヤ';
  } else if (now.weekday == DateTime.saturday) {
    // 土曜日
    timetable['tableInfo']['selectedTableNames'].add('stationCampusSaturdays');
    timetable['tableInfo']['selectedTableNames'].add('campusStationSaturdays');
    timetable['tableInfo']['selectedTableNames'].add('campusFRCSaturdays');
    timetable['tableInfo']['selectedTableNames'].add('frcCampusSaturdays');
    timetable['tableInfo']['dayOfWeek'] = '土曜日ダイヤ';
  }

  if (exceptionalHolidays.contains(DateTime(now.year, now.month, now.day))) {
    if (now.weekday >= DateTime.monday && now.weekday <= DateTime.friday) {
      // 授業を行う祝日(平日)
      timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusWeekdays';
      timetable['tableInfo']['selectedTableNames'][1] = 'campusStationWeekdays';
      timetable['tableInfo']['selectedTableNames'][2] = 'campusFRCWeekdays';
      timetable['tableInfo']['selectedTableNames'][3] = 'frcCampusWeekdays';
      timetable['tableInfo']['dayOfWeek'] = '平日ダイヤ';
    } else if (now.weekday == DateTime.saturday) {
      // 授業を行う祝日(土曜日)
      timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusSaturdays';
      timetable['tableInfo']['selectedTableNames'][1] = 'campusStationSaturdays';
      timetable['tableInfo']['selectedTableNames'][2] = 'campusFRCSaturdays';
      timetable['tableInfo']['selectedTableNames'][3] = 'frcCampusSaturdays';
      timetable['tableInfo']['dayOfWeek'] = '土曜日ダイヤ';
    }
  } else if (additionalHolidays.contains(DateTime(now.year, now.month, now.day))) {
    // 臨時の休業日、追加で祝日扱いする日
    timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusSundaysHolidays';
    timetable['tableInfo']['selectedTableNames'][1] = 'campusStationSundaysHolidays';
    timetable['tableInfo']['selectedTableNames'][2] = '';
    timetable['tableInfo']['selectedTableNames'][3] = '';
    timetable['tableInfo']['dayOfWeek'] = '日曜日/祝日ダイヤ';
  } else if (timetable['specialDates'].contains(DateTime(now.year, now.month, now.day))) {
    // 特別ダイヤに切り替える日
    timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusSpecial';
    timetable['tableInfo']['selectedTableNames'][1] = 'campusStationSpecial';
    timetable['tableInfo']['dayOfWeek'] = timetable['specialDateName'];
  } else if (timetable['noBusDates'].contains(DateTime(now.year, now.month, now.day))) {
    // バス運休日(年末年始など)
    timetable['tableInfo']['selectedTableNames'][0] = '';
    timetable['tableInfo']['selectedTableNames'][1] = '';
    timetable['tableInfo']['selectedTableNames'][2] = '';
    timetable['tableInfo']['selectedTableNames'][3] = '';
    timetable['tableInfo']['dayOfWeek'] = 'バス運休日';
  }
  return timetable;
}
