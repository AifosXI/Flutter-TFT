import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tft/views/auth/widgets/button-redirect.dart';
import 'package:flutter_tft/views/auth/widgets/custom-input.dart';

class SigninView extends StatelessWidget {
  static String routeName = '/signin';

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
                                const CustomInput("Email", Icons.alternate_email_rounded),
                                const CustomInput('Nom d\'utilisateur', Icons.person_outline_rounded),
                                const CustomInput('Mot de passe', Icons.lock_outline_rounded),
                                const SizedBox(height: 20),
                                OutlinedButton(
                                    onPressed: () => print('Submit'),
                                    style: ButtonStyle(
                                      padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10)),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                      side: MaterialStateProperty.all(const BorderSide(width: 1, color: Colors.white)),
                                    ),
                                    child: const Text('Inscription',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16))
                                ),
                                const ButtonRedirect('Vous avez déjà un compte ?', 'Se connecter', 'signup'),
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