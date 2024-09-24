import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Track',
      theme: ThemeData(
        primarySwatch: Color.fromARGB(255, 109, 114, 119),
      ),
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}
