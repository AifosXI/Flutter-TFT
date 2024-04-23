import 'package:flutter/material.dart';
import 'package:flutter_tft/providers/auth_provider.dart';
import 'package:flutter_tft/providers/user_provider.dart';
import 'package:flutter_tft/views/auth/signup_view.dart';
import 'package:flutter_tft/views/auth/signin_view.dart';
import 'package:flutter_tft/views/home/home.dart';
import 'package:flutter_tft/views/not_found_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthProvider authProvider = AuthProvider();
  final UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider.value(value: userProvider),
      ],
      child: MaterialApp(
      title: 'TFT Flutter Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'GillSansMT',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodySmall: TextStyle(),
            bodyMedium: TextStyle(),
          ).apply(
              bodyColor: const Color(0xFF56496b),
          )
      ),
      home: const HomePage(),
      )
    );
  }
}


