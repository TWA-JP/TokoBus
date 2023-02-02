import 'package:flutter/material.dart';
import 'code.dart';

class FullTimetableView extends StatefulWidget {
  final List timetable;
  final Size size;
  final int tableIndex;

  const FullTimetableView({Key? key, required this.timetable, required this.size, required this.tableIndex}) : super(key: key);

  @override
  State<FullTimetableView> createState() => _FullTimetableViewState();
}

class _FullTimetableViewState extends State<FullTimetableView> {
  // 状態を管理する変数
  late List timetable;
  late Size size;
  late int tableIndex;

  @override
  void initState() {
    super.initState();
    // 受け取ったデータを状態を管理する変数に格納
    timetable = widget.timetable;
    size = widget.size;
    tableIndex = widget.tableIndex;
    mainLoop();
  }

  Future<void> mainLoop() async {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      setState(() {
        timetable = code();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color wasedaColor = const Color.fromRGBO(142, 23, 40, 1);
    return Scaffold(
      appBar: AppBar(
        title: Text(timetable[8][tableIndex]["title"]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: size.height * 0.05,
                    width: size.width * 0.2,
                    child: Text(
                      timetable[8][tableIndex]["string0"],
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: size.height * 0.05,
                    width: size.width * 0.4,
                    child: Text(
                      timetable[8][tableIndex]["string1"],
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: size.height * 0.05,
                    width: size.width * 0.2,
                    child: Text(
                      timetable[8][tableIndex]["string2"],
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    height: size.height * 0.05,
                    width: size.width * 0.16,
                    child: Text(
                      timetable[8][tableIndex]["string3"],
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < timetable[tableIndex].length; i++) ...{
                if (i == timetable[8][tableIndex]["nextBusIndex"]) ...{
                  OneRow(timetable: timetable, size: size, textStyle: const TextStyle(fontSize: 17), backgroundColor: wasedaColor, tableIndex: tableIndex, rowIndex: i),
                } else if (i < timetable[8][tableIndex]["nextBusIndex"]) ...{
                  OneRow(timetable: timetable, size: size, textStyle: const TextStyle(fontSize: 17, color: Colors.grey), backgroundColor: Colors.black, tableIndex: tableIndex, rowIndex: i),
                } else ...{
                  OneRow(timetable: timetable, size: size, textStyle: const TextStyle(fontSize: 17), backgroundColor: Colors.black, tableIndex: tableIndex, rowIndex: i)
                },
              },
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text("${timetable[8]["tableVer"]} ${timetable[8]["dayOfWeek"]}ダイヤ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OneRow extends StatelessWidget {
  final List timetable;
  final Size size;
  final TextStyle textStyle;
  final Color backgroundColor;
  final int tableIndex;
  final int rowIndex;

  const OneRow({Key? key, required this.timetable, required this.size, required this.textStyle, required this.backgroundColor, required this.tableIndex, required this.rowIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: AlignmentDirectional.center,
          height: size.height * 0.05,
          width: size.width * 0.2,
          color: backgroundColor,
          child: Text(
            timetable[tableIndex][rowIndex][4],
            style: textStyle,
          ),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          height: size.height * 0.05,
          width: size.width * 0.4,
          color: backgroundColor,
          child: Text(
            timetable[tableIndex][rowIndex][5],
            style: textStyle,
          ),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          height: size.height * 0.05,
          width: size.width * 0.2,
          color: backgroundColor,
          child: Text(
            timetable[tableIndex][rowIndex][6],
            style: textStyle,
          ),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          height: size.height * 0.05,
          width: size.width * 0.16,
          color: backgroundColor,
          child: Text(
            timetable[tableIndex][rowIndex][7],
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
