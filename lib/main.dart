import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define your custom MaterialColor
const MaterialColor customColor = MaterialColor(
  0xFF6D7277, // Primary color value
  <int, Color>{
    50: Color(0xFFECEFF1), // 10%
    100: Color(0xFFB0BEC5), // 20%
    200: Color(0xFF90A4AE), // 30%
    300: Color(0xFF78909C), // 40%
    400: Color(0xFF607D8B), // 50%
    500: Color(0xFF6D7277), // 60%
    600: Color(0xFF455A64), // 70%
    700: Color(0xFF37474F), // 80%
    800: Color(0xFF263238), // 90%
    900: Color(0xFF000000), // 100%
  },
);
    return MaterialApp(
      title: 'Map Track',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}
