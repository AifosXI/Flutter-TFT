import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double? fontSize;

  const CustomTitle(this.title, this.fontSize , {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/left_cloud.png', width: 93),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700, fontSize: fontSize)),
          Image.asset('assets/images/right_cloud.png', width: 93),
        ]
    );
  }
}
