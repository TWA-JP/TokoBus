import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show SchedulerBinding;
import 'package:provider/provider.dart';

import 'services/theme.dart';
import 'services/code.dart';
import 'services/show_dialog_on_special_date.dart';
import 'services/json_alart_handler.dart';
import 'services/theme_provider.dart';
import 'services/intro_screen_handler.dart';
import 'pages/portrait_layout.dart';
import 'pages/landscape_layout.dart';
import 'pages/settings_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // 縦向き
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(ChangeNotifierProvider(create: (_) => ThemeProvider(), child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'TokoBus',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const MyHomePage(),
        '/settings': (BuildContext context) => const SettingsPage(),
        // '/fulltable':
      },
      themeMode: themeProvider.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Map timetable = code();

  Future<void> mainLoop() async {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      setState(() {
        timetable = code();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    mainLoop();
    showIntroIfRequired(context);

    // 他の初期化処理
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showDialogOnSpecialDate(context: context, timetable: timetable);
    });
    jsonAlertHandler(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return PortraitLayout(size: size, timetable: timetable);
    } else {
      return LandscapeLayout(size: size, timetable: timetable);
    }
  }
}
