import 'package:nholiday_jp/nholiday_jp.dart';

// timetableの構造メモ
//   timetable['fullTables']['stationCampusWeekdays' -> 'frcCampusSaturday']['table'] == [[int 時, int 分, DateTime 時刻, Duration 残り時間, String 時:分, String 残り時間, String 場所, String 車椅子対応], ...]
//   timetable['fullTables']['stationCampusWeekdays' -> 'frcCampusSaturday']['nextBusIndex'] == int
//   timetable['compactTables'][0 -> 3] == [[String 時:分, String 残り時間, String 場所, String 車椅子対応], * 3]
//   timetable['tableInfo'] == 下のコード参照
//   timetable['startDate'] == DateTime(year, month, day)
//   timetable['url']['waseda_bus_page']: 'https://.../バスページ/'
//   timetable['url']['default_pdf']: 'https://.../通常ダイヤ.pdf'
//   timetable['url']['special_pdf']: {DateTime(year, month, day): 'https://.../特別ダイヤ.pdf', ...}

// 時刻表更新時のチェックリスト
//   tableVer
//   startDate, code.dart
//   default_pdf
//   special_pdf
//   exceptionalHolidays
//   additionalHolidays
//   specialDates
//   exceptionalHolidays, additionalHolidaysは学部暦ではなく大学暦によって決定される
//     https://www.waseda.jp/top/about/work/organizations/academic-affairs-division/academic-calendar

Map timetableProviderWinterVacation() {
  // 平日(休講日)
  List stationCampusWeekdays = [
    [07, 45, '北口', '×'],
    [08, 00, '北口', '○'],
    [08, 15, '北口', '×'],
    [08, 25, '北口', '×'],
    [08, 30, '北口', '×'],
    [08, 55, '北口', '×'],
    [09, 10, '北口', '×'],
    [09, 25, '北口', '×'],
    [09, 45, '北口', '×'],
    [10, 05, '北口', '○'],
    [10, 25, '北口', '×'],
    [10, 55, '北口', '×'],
    [11, 35, '北口', '○'],
    [11, 50, '北口', '×'],
    [12, 05, '北口', '×'],
    [12, 25, '南口', '×'],
    [12, 45, '南口', '×'],
    [13, 05, '南口', '×'],
    [13, 25, '南口', '×'],
    [13, 45, '北口', '○'],
    [14, 15, '南口', '×'],
    [14, 35, '南口', '×'],
    [14, 55, '南口', '×'],
    [15, 15, '南口', '×'],
    [15, 35, '南口', '×'],
    [16, 10, '北口', '○'],
    [16, 35, '南口', '×'],
    [17, 20, '南口', '×'],
    [18, 05, '北口', '○'],
    [18, 25, '南口', '×'],
    [18, 55, '南口', '×'],
    [20, 05, '南口', '×'],
    [21, 05, '南口', '×'],
  ];

  List stationCampusSaturdays = [for (var value in stationCampusWeekdays) List.from(value)];

  List stationCampusSundaysHolidays = [
    [08, 15, '北口', '×'],
    [08, 55, '北口', '×'],
    [09, 45, '北口', '×'],
    [11, 25, '北口', '×'],
    [12, 15, '南口', '×'],
    [12, 55, '南口', '×'],
    [14, 45, '南口', '×'],
    [15, 45, '南口', '×'],
    [16, 45, '南口', '×'],
    [17, 25, '南口', '×'],
    [18, 15, '南口', '×'],
    [19, 45, '南口', '×'],
  ];

  // 平日(授業日)
  List stationCampusSpecial = [
    [07, 45, '北口', '×'],
    [08, 00, '北口', '○'],
    [08, 05, '北口', '×'],
    [08, 10, '北口', '×'],
    [08, 15, '北口', '×'],
    [08, 20, '北口', '×'],
    [08, 25, '北口', '×'],
    [08, 30, '北口', '×'],
    [08, 55, '北口', '×'],
    [09, 10, '北口', '×'],
    [09, 25, '北口', '×'],
    [09, 45, '北口', '×'],
    [10, 00, '北口', '×'],
    [10, 05, '北口', '○'],
    [10, 10, '北口', '×'],
    [10, 15, '北口', '×'],
    [10, 25, '北口', '×'],
    [10, 55, '北口', '×'],
    [11, 35, '北口', '○'],
    [11, 50, '北口', '×'],
    [12, 05, '北口', '×'],
    [12, 25, '南口', '×'],
    [12, 35, '南口', '×'],
    [12, 45, '南口', '×'],
    [13, 05, '南口', '×'],
    [13, 25, '南口', '×'],
    [13, 45, '北口', '○'],
    [14, 15, '南口', '×'],
    [14, 35, '南口', '×'],
    [14, 55, '南口', '×'],
    [15, 15, '南口', '×'],
    [15, 35, '南口', '×'],
    [16, 10, '北口', '○'],
    [16, 35, '南口', '×'],
    [17, 20, '南口', '×'],
    [18, 05, '北口', '○'],
    [18, 25, '南口', '×'],
    [18, 55, '南口', '×'],
    [20, 05, '南口', '×'],
    [21, 05, '南口', '×'],
  ];

  // 平日(休講日)
  List campusStationWeekdays = [
    [08, 35, '北口', '×'],
    [09, 40, '北口', '×'],
    [10, 05, '北口', '×'],
    [10, 35, '北口', '×'],
    [11, 05, '北口', '○'],
    [11, 35, '北口', '×'],
    [12, 10, '南口', '×'],
    [12, 30, '南口', '×'],
    [12, 50, '南口', '×'],
    [13, 10, '南口', '×'],
    [13, 15, '北口', '○'],
    [13, 50, '南口', '×'],
    [14, 20, '南口', '×'],
    [14, 40, '南口', '×'],
    [15, 00, '南口', '×'],
    [15, 20, '南口', '×'],
    [15, 40, '北口', '○'],
    [16, 20, '南口', '×'],
    [16, 45, '南口', '×'],
    [17, 00, '南口', '×'],
    [17, 30, '北口', '○'],
    [17, 45, '南口', '×'],
    [18, 05, '南口', '×'],
    [18, 25, '南口', '×'],
    [18, 40, '南口', '×'],
    [19, 00, '北口', '○'],
    [19, 30, '南口', '×'],
    [19, 50, '南口', '×'],
    [20, 15, '南口', '×'],
    [20, 35, '南口', '×'],
    [20, 50, '南口', '×'],
    [21, 15, '南口', '×'],
    [21, 45, '南口', '×'],
    [22, 00, '南口', '×'],
  ];

  List campusStationSaturdays = [for (var value in campusStationWeekdays) List.from(value)];

  List campusStationSundaysHolidays = [
    [08, 35, '北口', '×'],
    [09, 25, '北口', '×'],
    [11, 05, '北口', '×'],
    [12, 00, '南口', '×'],
    [12, 40, '南口', '×'],
    [14, 30, '南口', '×'],
    [15, 30, '南口', '×'],
    [16, 30, '南口', '×'],
    [17, 10, '南口', '×'],
    [18, 00, '南口', '×'],
    [19, 30, '南口', '×'],
    [21, 00, '南口', '×'],
  ];

  // 平日(授業日)
  List campusStationSpecial = [
    [08, 35, '北口', '×'],
    [09, 35, '北口', '×'],
    [10, 05, '北口', '×'],
    [10, 35, '北口', '×'],
    [11, 05, '北口', '○'],
    [11, 35, '北口', '×'],
    [12, 10, '南口', '×'],
    [12, 30, '南口', '×'],
    [12, 40, '南口', '×'],
    [12, 50, '南口', '×'],
    [13, 10, '南口', '×'],
    [13, 15, '北口', '○'],
    [13, 50, '南口', '×'],
    [14, 20, '南口', '×'],
    [14, 40, '南口', '×'],
    [15, 00, '南口', '×'],
    [15, 10, '南口', '×'],
    [15, 20, '南口', '×'],
    [15, 30, '南口', '×'],
    [15, 40, '北口', '○'],
    [16, 20, '南口', '×'],
    [16, 45, '南口', '×'],
    [17, 00, '南口', '×'],
    [17, 05, '南口', '×'],
    [17, 10, '南口', '×'],
    [17, 15, '南口', '×'],
    [17, 20, '南口', '×'],
    [17, 30, '北口', '○'],
    [17, 45, '南口', '×'],
    [18, 05, '南口', '×'],
    [18, 25, '南口', '×'],
    [18, 40, '南口', '×'],
    [19, 00, '北口', '○'],
    [19, 30, '南口', '×'],
    [19, 50, '南口', '×'],
    [20, 15, '南口', '×'],
    [20, 35, '南口', '×'],
    [20, 50, '南口', '×'],
    [21, 15, '南口', '×'],
    [21, 45, '南口', '×'],
    [22, 00, '南口', '×'],
  ];

  List campusFRCWeekdays = [
    [08, 25, '正門', '×'],
    [08, 35, '正門', '×'],
    [09, 00, '正門', '×'],
    [09, 50, '正門', '×'],
    [10, 30, '正門', '×'],
    [12, 05, '正門', '×'],
    [12, 50, '正門', '×'],
    [13, 30, '正門', '×'],
    [14, 10, '正門', '×'],
    [14, 45, '正門', '×'],
    [16, 15, '正門', '×'],
    [16, 40, '正門', '×'],
    [17, 00, '正門', '×'],
    [17, 20, '正門', '×'],
    [18, 10, '正門', '×'],
    [18, 35, '正門', '×'],
    [19, 05, '正門', '×'],
    [20, 30, '正門', '×'],
    [21, 00, '正門', '×'],

    [08, 45, '南門', '×'],
    [09, 10, '南門', '×'],
    [10, 20, '南門', '×'],
    [10, 40, '南門', '×'],
    [10, 50, '南門', '×'],
    [12, 25, '南門', '×'],
    [12, 35, '南門', '×'],
    [13, 00, '南門', '×'],
    [13, 10, '南門', '×'],
    [14, 00, '南門', '×'],
    [14, 55, '南門', '×'],
    [15, 05, '南門', '×'],
    [16, 25, '南門', '×'],
    [16, 50, '南門', '×'],
    [17, 10, '南門', '×'],
    [18, 45, '南門', '×'],
    [18, 55, '南門', '×'],
    [20, 40, '南門', '×'],
  ];

  List campusFRCSaturdays = [
    [08, 35, '正門', '×'],
    [09, 00, '正門', '×'],
    [10, 30, '正門', '×'],
    [12, 05, '正門', '×'],
    [12, 25, '正門', '×'],
    [14, 45, '正門', '×'],
    [16, 40, '正門', '×'],
    [18, 35, '正門', '×'],
    [20, 30, '正門', '×'],
    [20, 50, '正門', '×'],

    [08, 45, '南門', '×'],
    [09, 10, '南門', '×'],
    [10, 15, '南門', '×'],
    [10, 50, '南門', '×'],
    [12, 15, '南門', '×'],
    [12, 35, '南門', '×'],
    [13, 05, '南門', '×'],
    [14, 55, '南門', '×'],
    [15, 05, '南門', '×'],
    [16, 50, '南門', '×'],
    [17, 10, '南門', '×'],
    [18, 45, '南門', '×'],
    [19, 10, '南門', '×'],
    [20, 40, '南門', '×'],
    [21, 00, '南門', '×'],
  ];

  List frcCampusWeekdays = [
    [08, 30, '正門', '○'],
    [08, 50, '正門', '×'],
    [09, 15, '正門', '×'],
    [10, 25, '正門', '○'],
    [10, 55, '正門', '○'],
    [12, 40, '正門', '○'],
    [13, 15, '正門', '×'],
    [14, 05, '正門', '×'],
    [14, 40, '正門', '×'],
    [15, 10, '正門', '○'],
    [16, 30, '正門', '○'],
    [17, 15, '正門', '×'],
    [17, 25, '正門', '○'],
    [18, 20, '正門', '○'],
    [19, 00, '正門', '×'],
    [19, 15, '正門', '○'],
    [20, 45, '正門', '○'],
    [21, 05, '正門', '○'],
    [21, 40, '正門', '○'],

    [08, 40, '南門', '×'],
    [09, 05, '南門', '×'],
    [09, 55, '南門', '×'],
    [10, 35, '南門', '×'],
    [10, 45, '南門', '×'],
    [12, 10, '南門', '×'],
    [12, 30, '南門', '×'],
    [12, 55, '南門', '×'],
    [13, 05, '南門', '×'],
    [13, 35, '南門', '×'],
    [14, 50, '南門', '×'],
    [15, 00, '南門', '×'],
    [16, 20, '南門', '×'],
    [16, 45, '南門', '×'],
    [17, 05, '南門', '×'],
    [18, 40, '南門', '×'],
    [18, 50, '南門', '×'],
    [20, 35, '南門', '×'],
  ];

  List frcCampusSaturdays = [
    [08, 50, '正門', '×'],
    [09, 15, '正門', '×'],
    [10, 25, '正門', '○'],
    [10, 55, '正門', '○'],
    [12, 20, '正門', '○'],
    [13, 10, '正門', '○'],
    [15, 10, '正門', '○'],
    [17, 15, '正門', '○'],
    [19, 15, '正門', '○'],
    [20, 45, '正門', '○'],
    [21, 05, '正門', '○'],

    [08, 40, '南門', '×'],
    [09, 05, '南門', '×'],
    [10, 35, '南門', '×'],
    [12, 10, '南門', '×'],
    [12, 30, '南門', '×'],
    [13, 00, '南門', '×'],
    [14, 50, '南門', '×'],
    [15, 00, '南門', '×'],
    [16, 45, '南門', '×'],
    [17, 05, '南門', '×'],
    [18, 40, '南門', '×'],
    [18, 50, '南門', '×'],
    [20, 35, '南門', '×'],
    [20, 55, '南門', '×'],
  ];

  List initCompact = [
    [
      '-',
      '-',
      '-',
      '-',
    ],
    [
      '-',
      '-',
      '-',
      '-',
    ],
    [
      '-',
      '-',
      '-',
      '-',
    ]
  ];

  List sortTimetable(List table) {
    table.sort(
      (a, b) {
        int result = a[0].compareTo(b[0]);
        if (result != 0) return result;
        return a[1].compareTo(b[1]);
      },
    );
    return table;
  }

  campusFRCWeekdays = sortTimetable(campusFRCWeekdays);
  campusFRCSaturdays = sortTimetable(campusFRCSaturdays);
  frcCampusWeekdays = sortTimetable(frcCampusWeekdays);
  frcCampusSaturdays = sortTimetable(frcCampusSaturdays);

  Map timetable = {
    'fullTables': {
      'stationCampusWeekdays': {
        'table': stationCampusWeekdays,
        'dayOfWeek': '平日(休講日)',
        'tableFormat': 0,
        'nextBusIndex': 1000,
      },
      'stationCampusSaturdays': {
        'table': stationCampusSaturdays,
        'dayOfWeek': '土曜日',
        'tableFormat': 0,
        'nextBusIndex': 1000,
      },
      'stationCampusSundaysHolidays': {
        'table': stationCampusSundaysHolidays,
        'dayOfWeek': '日曜日/祝日',
        'tableFormat': 0,
        'nextBusIndex': 1000,
      },
      'stationCampusSpecial': {
        'table': stationCampusSpecial,
        'dayOfWeek': '平日(授業日)',
        'tableFormat': 0,
        'nextBusIndex': 1000,
      },
      'campusStationWeekdays': {
        'table': campusStationWeekdays,
        'dayOfWeek': '平日(休講日)',
        'tableFormat': 1,
        'nextBusIndex': 1000,
      },
      'campusStationSaturdays': {
        'table': campusStationSaturdays,
        'dayOfWeek': '土曜日',
        'tableFormat': 1,
        'nextBusIndex': 1000,
      },
      'campusStationSundaysHolidays': {
        'table': campusStationSundaysHolidays,
        'dayOfWeek': '日曜日/祝日',
        'tableFormat': 1,
        'nextBusIndex': 1000,
      },
      'campusStationSpecial': {
        'table': campusStationSpecial,
        'dayOfWeek': '平日(授業日)',
        'tableFormat': 1,
        'nextBusIndex': 1000,
      },
      'campusFRCWeekdays': {
        'table': campusFRCWeekdays,
        'dayOfWeek': '平日(休講日)',
        'tableFormat': 2,
        'nextBusIndex': 1000,
      },
      'campusFRCSaturdays': {
        'table': campusFRCSaturdays,
        'dayOfWeek': '土曜日',
        'tableFormat': 2,
        'nextBusIndex': 1000,
      },
      'frcCampusWeekdays': {
        'table': frcCampusWeekdays,
        'dayOfWeek': '平日(休講日)',
        'tableFormat': 3,
        'nextBusIndex': 1000,
      },
      'frcCampusSaturdays': {
        'table': frcCampusSaturdays,
        'dayOfWeek': '土曜日',
        'tableFormat': 3,
        'nextBusIndex': 1000,
      },
    },
    'compactTables': [
      for (int i = 0; i <= 3; i++) [for (var value in initCompact) List.from(value)]
    ],
    'tableInfo': {
      0: {'title': '小手指駅 → キャンパス', 'string0': '発車時刻', 'string1': '残り時間', 'string2': '乗車場所', 'string3': '車椅子'},
      1: {'title': 'キャンパス → 小手指駅', 'string0': '発車時刻', 'string1': '残り時間', 'string2': '降車場所', 'string3': '車椅子'},
      2: {'title': 'キャンパス → FRC', 'string0': '発車時刻', 'string1': '残り時間', 'string2': '乗車場所', 'string3': '接続'},
      3: {'title': 'FRC → キャンパス', 'string0': '発車時刻', 'string1': '残り時間', 'string2': '降車場所', 'string3': '接続'},
      'tableVer': '2023年度春季休業期間',
      'selectedTableNames': [],
    },
    'startDate': DateTime(2024, 02, 03),
    'url': {
      'waseda_bus_page': 'https://www.waseda.jp/fhum/hum/facility/bus-parking/',
      'default_pdf': 'https://www.waseda.jp/tokorozawa/kg/doc/bus/School_Bus_Timetable_for_Spring_Vacation(from_3_February_to_31_March_2024).pdf',
      'special_pdf': {
        DateTime(2024, 03, 28): 'https://www.waseda.jp/tokorozawa/kg/doc/bus/School_Bus_Special_Schedule(Thursday_28th_March_2024).pdf',
      },
    },
  };

  var dt = DateTime.now();
  var holidaysOfMonth = NHolidayJp.getByMonth(dt.year, dt.month);
  List dateOfHolidaysOfMonth = [];
  for (int i = 0; i < holidaysOfMonth.length; i++) {
    dateOfHolidaysOfMonth.add(holidaysOfMonth[i].date);
  }
  if (dt.weekday == 7 || dateOfHolidaysOfMonth.contains(dt.day) == true) {
    // 日曜日か祝日
    timetable['tableInfo']['selectedTableNames'].add('stationCampusSundaysHolidays');
    timetable['tableInfo']['selectedTableNames'].add('campusStationSundaysHolidays');
    timetable['tableInfo']['selectedTableNames'].add('');
    timetable['tableInfo']['selectedTableNames'].add('');
  } else if (dt.weekday >= 1 && dt.weekday <= 5) {
    // 平日
    timetable['tableInfo']['selectedTableNames'].add('stationCampusWeekdays');
    timetable['tableInfo']['selectedTableNames'].add('campusStationWeekdays');
    timetable['tableInfo']['selectedTableNames'].add('campusFRCWeekdays');
    timetable['tableInfo']['selectedTableNames'].add('frcCampusWeekdays');
  } else {
    // 土曜日
    timetable['tableInfo']['selectedTableNames'].add('stationCampusSaturdays');
    timetable['tableInfo']['selectedTableNames'].add('campusStationSaturdays');
    timetable['tableInfo']['selectedTableNames'].add('campusFRCSaturdays');
    timetable['tableInfo']['selectedTableNames'].add('frcCampusSaturdays');
  }

  // 授業を行う祝日
  List exceptionalHolidays = [];
  for (int i = 0; i < exceptionalHolidays.length; i++) {
    if (dt.year == exceptionalHolidays[i].year && dt.month == exceptionalHolidays[i].month && dt.day == exceptionalHolidays[i].day) {
      timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusWeekdays';
      timetable['tableInfo']['selectedTableNames'][1] = 'campusStationWeekdays';
      timetable['tableInfo']['selectedTableNames'][2] = 'campusFRCWeekdays';
      timetable['tableInfo']['selectedTableNames'][3] = 'frcCampusWeekdays';
    }
  }

  // 臨時の休業日, 追加で祝日扱いする日
  List additionalHolidays = [
  ];
  for (int i = 0; i < additionalHolidays.length; i++) {
    if (dt.year == additionalHolidays[i].year && dt.month == additionalHolidays[i].month && dt.day == additionalHolidays[i].day) {
      timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusSundaysHolidays';
      timetable['tableInfo']['selectedTableNames'][1] = 'campusStationSundaysHolidays';
      timetable['tableInfo']['selectedTableNames'][2] = '';
      timetable['tableInfo']['selectedTableNames'][3] = '';
    }
  }

  // 授業日ダイヤに切り替える日(特別ダイヤ)
  List specialDates = [
    DateTime(2024, 02, 03),

    DateTime(2024, 02, 05),
    DateTime(2024, 02, 06),
    DateTime(2024, 02, 07),
    DateTime(2024, 02, 08),
    DateTime(2024, 02, 09),

    DateTime(2024, 02, 13),
    DateTime(2024, 02, 14),
  ];
  for (int i = 0; i < specialDates.length; i++) {
    if (dt.year == specialDates[i].year && dt.month == specialDates[i].month && dt.day == specialDates[i].day) {
      timetable['tableInfo']['selectedTableNames'][0] = 'stationCampusSpecial';
      timetable['tableInfo']['selectedTableNames'][1] = 'campusStationSpecial';
    }
  }

  return timetable;
}
