import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:y_perz/views/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = ThemeData(
      primarySwatch: materialColor(),
      textTheme:
          Theme.of(context).textTheme.copyWith().apply(fontFamily: "Gotham"),
    );

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LoginScreen(),
    );
  }
}

materialColor() {
  Map<int, Color> colorCodes = {
    50: const Color(0xff148B4B),
    100: const Color(0xff148B4B),
    200: const Color(0xff148B4B),
    300: const Color(0xff148B4B),
    400: const Color(0xff148B4B),
    500: const Color(0xff148B4B),
    600: const Color(0xff148B4B),
    700: const Color(0xff148B4B),
    800: const Color(0xff148B4B),
    900: const Color(0xff148B4B),
  };

  MaterialColor customColor = MaterialColor(0xff148B4B, colorCodes);
  return customColor;
}
