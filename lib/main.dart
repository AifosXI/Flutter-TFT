import 'package:flutter/material.dart';
import 'package:flutter_tft/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TFT Flutter Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'GillSansMT',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodySmall: TextStyle(),
            bodyMedium: TextStyle(),
          ).apply(
              bodyColor: const Color(0xFF56496b)
          )
      ),
      home: const HomePage(),
    );
  }
}
