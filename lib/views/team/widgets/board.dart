import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/new-synergies.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {

  String championImage = 'assets/vectors/coins.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF56496B),
          borderRadius: BorderRadius.circular(6)
      ),
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      child: Column(
        children: [
          customRow(MainAxisAlignment.start),
          customRow(MainAxisAlignment.end),
          customRow(MainAxisAlignment.start),
          customRow(MainAxisAlignment.end),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF56496B)),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
            child: Column(
              children: [
                Draggable<String>(
                  data: 'assets/images/Caitlyn.png',
                  child: champion('assets/images/Caitlyn.png'),
                  feedback: champion('assets/images/Caitlyn.png'),
                  childWhenDragging: champion('assets/images/Caitlyn.png'),
                ),
                Draggable<String>(
                  data: 'assets/images/Kayn.png',
                  child: champion('assets/images/Kayn.png'),
                  feedback: champion('assets/images/Kayn.png'),
                  childWhenDragging: champion('assets/images/Kayn.png'),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }

  Widget customRow(position) {
    return Row(
      mainAxisAlignment: position,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for(int i = 0; i < 7; i++) DragTarget<String>(
          onAcceptWithDetails: (details) =>
          {
            print(details.offset),
            setState(() => championImage = details.data)
          },
            builder: (context, _, __) => RotatedBox(quarterTurns: 1,
            child: ClipPath(
              clipper: Hexagon(),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFA992CE),
                ),
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: RotatedBox(quarterTurns: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(championImage)
                            )),
                      ),
                    )
                ),
              ),
            )
        ))
      ],

    );
  }

  Widget champion(asset) {
    return SizedBox(
      width: 80,
      height: 80,
      child:Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(asset),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child:
            SizedBox(
                height: 20,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Center(
                      child: Text('Caitlyn', textAlign: TextAlign.center,),
                    ),
                  ),
                )
            ),
            // Text(championsList[0]['champion'][index].name),
          )
        ],
      ),
    );
  }
}