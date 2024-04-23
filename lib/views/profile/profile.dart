import 'package:flutter/material.dart';
import 'package:flutter_tft/views/profile/widgets/header.dart';
import 'package:flutter_tft/views/profile/widgets/teams.dart';

class Profile extends StatelessWidget {
  static String routeName = '/profile';

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight, top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              SizedBox(height: 20),
              TeamsList(),
            ],
          ),
        )
    );
  }
}