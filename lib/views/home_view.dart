import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          'HomeView !',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}