import 'package:flutter/material.dart';
import '../../models/signup_form_model.dart';

class SignupView extends StatefulWidget {
  static String routeName = '/signup';

  const SignupView({super.key});

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView>{
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  SignupForm signupForm;
  FormState get form => key.currentState;

  @override
  void initState() {
    signupForm = SignupForm(email: null, username: null, password: null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const Text(
            'SignupView !',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
    );
  }
}