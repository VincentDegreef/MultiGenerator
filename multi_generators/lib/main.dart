// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_generators/Screens/Splash_screen.dart';
import 'package:multi_generators/Utils/appStyles.dart';
import 'package:window_manager/window_manager.dart';
import 'package:window_size/window_size.dart';

import 'Screens/coinToss_screen.dart';
import 'Screens/namePicker_screen.dart';
import 'Screens/randomName_screen.dart';
import 'Screens/randomNumber_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(600, 800),
    size: Size(1280, 780),
    center: true,
    title: 'Multi Generator App',
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(600, 800));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Generator App',
      debugShowCheckedModeBanner: false,
      theme: AppStyles.appTheme,
      routes:{
        '/randomNumber': (context) => RandomNumberScreen(),
        '/randomName': (context) => RandomNameScreen(),
        '/namePicker': (context) => NamePickerScreen(),
        '/coinToss': (context) => CoinTossScreen(),
      },
      home: SplashScreen(),
    );
  }
}