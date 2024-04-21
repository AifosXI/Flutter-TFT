import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tft/views/team/widgets/board.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Board View'),
        Board(),
      ],
    );
  }
}