import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tft/views/auth/widgets/button-redirect.dart';
import 'package:flutter_tft/views/auth/widgets/custom-input.dart';
import '../../models/signup_form_model.dart';

class SignupView extends StatefulWidget {
  static String routeName = '/signup';

  const SignupView({super.key});

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView>{
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SignupForm signupForm;
  FormState? get form => key.currentState;

  @override
  void initState() {
    signupForm = SignupForm(email: '', username: '', password: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_banner.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment(-0.51, -0.5),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF56496b)),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0x8056496b),
                ),
                child:SizedBox(
                    height: 500,
                    width: 398,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 7.8, sigmaY: 7.8),
                        child: DefaultTextStyle(
                          style: const TextStyle(color: Colors.white),
                          child: Container(
                            padding: const EdgeInsets.only(left: 80, right: 80, top: 30, bottom: 30),
                            child: Column(
                              children: [
                                const Text('Se connecter', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                                const SizedBox(height: 20),
                                const CustomInput("Email", Icons.alternate_email_rounded),
                                const CustomInput('Mot de passe', Icons.lock_outline_rounded),
                                const SizedBox(height: 20),
                                OutlinedButton(
                                    onPressed: () => print('Submit'),
                                    style: ButtonStyle(
                                      padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10)),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                      side: MaterialStateProperty.all(const BorderSide(width: 1, color: Colors.white)),
                                    ),
                                    child: const Text('Connexion',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16))
                                ),
                                const ButtonRedirect('Vous n\'avez pas de compte ?', 'Créer un compte', 'signin'),
                              ],
                            ),),
                        ),
                      ),
                    )
                )
            )
          ],
        )
    );
  }
}