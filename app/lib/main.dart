import 'package:app/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'features/welcome/presentation/pages/splash_screen.dart';

void main() => runApp(DevicePreview(builder: (context) => MyApp(),),);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lover\'s Msg',
      theme: ThemeData(
        primaryColor: Color(0xfff72279),
        primaryColorLight: Color(0xfffee6f2),
        primaryColorDark: Color(0xfff49ac7),
        accentColor: Color(0xfffcfcfc)
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}