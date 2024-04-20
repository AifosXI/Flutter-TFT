import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String hintText;

  const CustomInput(this.hintText, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: Icon(icon, color: Colors.white, size: 20,)
          ),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
