import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  static String routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Text(
            'SigninView !',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
    );
  }
}