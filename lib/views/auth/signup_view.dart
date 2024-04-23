import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tft/providers/auth_provider.dart';
import 'package:flutter_tft/views/auth/signin_view.dart';
import 'package:flutter_tft/views/auth/widgets/button-redirect.dart';
import 'package:flutter_tft/views/auth/widgets/custom-input.dart';
import 'package:provider/provider.dart';

import '../../models/signup_form_model.dart';

class SignupView extends StatefulWidget {
  static String routeName = '/signup';

  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SignupForm signupForm;
  FormState get form => key.currentState!;

  @override
  void initState() {
    signupForm = SignupForm(email: '', username: '', password: '');
    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final error = await Provider.of<AuthProvider>(context, listen: false)
      .signup(signupForm);
      if(error == null && mounted){
        Navigator.pushNamed(context, 'signin');
      }
    }
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
                    height: 600,
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
                                const Text('S\'inscrire', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                                const SizedBox(height: 20),
                                Form(
                                    key: key,
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.white, width: 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.white, width: 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  hintText: 'Email',
                                                  hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                                                  labelStyle: const TextStyle(color: Colors.white),
                                                  prefixIcon: Icon(Icons.alternate_email_rounded, color: Colors.white, size: 20,)
                                              ),
                                              style: const TextStyle(color: Colors.white),
                                              onSaved: (newValue) {
                                                signupForm.email = newValue!;
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.white, width: 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.white, width: 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  hintText: 'Nom d\'utilisateur',
                                                  hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                                                  labelStyle: const TextStyle(color: Colors.white),
                                                  prefixIcon: Icon(Icons.person_outline_rounded, color: Colors.white, size: 20,)
                                              ),
                                              style: const TextStyle(color: Colors.white),
                                              onSaved: (newValue) {
                                                signupForm.username = newValue!;
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.white, width: 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.white, width: 1),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  hintText: 'Mot de passe',
                                                  hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                                                  labelStyle: const TextStyle(color: Colors.white),
                                                  prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.white, size: 20,)
                                              ),
                                              style: const TextStyle(color: Colors.white),
                                              onSaved: (newValue) {
                                                signupForm.password = newValue!;
                                              },
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        OutlinedButton(
                                            onPressed: submitForm,
                                            style: ButtonStyle(
                                              padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10)),
                                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                              side: MaterialStateProperty.all(const BorderSide(width: 1, color: Colors.white)),
                                            ),
                                            child: const Text('Inscription',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16))
                                        ),
                                  ],
                                )),
                                const ButtonRedirect('Vous avez déjà un compte ?', 'Se connecter', 'signin'),
                              ],
                            ),
                          ),
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