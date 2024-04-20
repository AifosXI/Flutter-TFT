import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonRedirect extends StatelessWidget {
  final String text;
  final String buttonText;
  final String link;

  const ButtonRedirect(this.text, this.buttonText, this.link, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 90),
        Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic, fontSize: 16),),
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, link),
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.only(left: 60, right: 60, top: 10, bottom: 10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              side: MaterialStateProperty.all(const BorderSide(width: 1, color: Colors.white)),
            ),
            child: Text(buttonText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))
        ),
      ],
    );
  }
}
