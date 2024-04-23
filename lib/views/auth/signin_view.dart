import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tft/views/auth/widgets/button-redirect.dart';
import 'package:provider/provider.dart';
import '../../models/signin_form_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/user_provider.dart';

class SigninView extends StatefulWidget {
  static String routeName = '/signin';

  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView>{
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SigninForm signinForm;
  FormState get form => key.currentState!;

  @override
  void initState() {
    signinForm = SigninForm(email: '', password: '');
    super.initState();
  }

  Future<void> submitForm() async {
    print(signinForm);
    if (form.validate()) {
      form.save();
      final response = await Provider.of<AuthProvider>(context, listen: false)
          .signin(signinForm);
      if (mounted) {
        Provider.of<UserProvider>(context, listen: false).updateUser(response);
        Navigator.pushNamed(context, 'profile');
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
                                Form(
                                    key: key,
                                    child: Column(
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
                                        signinForm.email = newValue!;
                                      },
                                    ),
                                    const SizedBox(height: 20),
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
                                        signinForm.password = newValue!;
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    OutlinedButton(
                                        onPressed: submitForm,
                                        style: ButtonStyle(
                                          padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10)),
                                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                          side: MaterialStateProperty.all(const BorderSide(width: 1, color: Colors.white)),
                                        ),
                                        child: const Text('Connexion',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16))
                                    ),
                                  ],
                                )),
                                const ButtonRedirect('Vous n\'avez pas de compte ?', 'Créer un compte', 'signup'),
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