import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/left_cloud.png', width: 93),
          const Text("Introduction", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
          Image.asset('assets/images/right_cloud.png', width: 93),
        ]
    );
  }
}
