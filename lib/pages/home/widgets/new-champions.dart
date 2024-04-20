import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tft/models/champions.dart';

class NewSetData extends StatelessWidget {
  NewSetData({super.key});

  final List<Champions> champions = Champions('', '', []).champions();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 20),
          child:const Text('De nouveaux champions !',  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) =>
                    GestureDetector(
                        onTap: (() => print('Clicked')),
                        child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: SizedBox(
                                      width: 75,
                                      height: 75,
                                      child: Image.asset(champions[index].icon),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 2,
                                    child: getChampionsTraits(champions[index]),
                                  )
                                ],
                              ),
                              Text(champions[index].name),
                            ]
                        )
                    )
                ),
                separatorBuilder: ((context, index) => const SizedBox(width: 10)),
                itemCount: champions.length
            )
          // ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: ((context, index) => GestureDetector(
          //         onTap: (() => print('Clicked')),
          //         child: Column(
          //             children: [
          //               ClipRRect(
          //                 borderRadius: BorderRadius.circular(12),
          //                 child: SizedBox(
          //                   width: 75,
          //                   height: 75,
          //                   child: Image.asset(champions[index].icon),
          //                 ),
          //               ),
          //               Text(champions[index].name),
          //             ]
          //         )
          //     )
          //     ),
          //     separatorBuilder: ((context, index) => const SizedBox(width:10)),
          //     itemCount: champions.length
          // )
        )
      ],
    );
  }

  Widget getChampionsTraits(champion) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: const Color(0xFF56496b),
            borderRadius: BorderRadius.circular(1000)
        ),
        child: Column(
          children: [
            for (int i = 0; i < champion.traits.length; i++) Container(
              margin: const EdgeInsets.only(top: 2, bottom: 2),
              child: SizedBox(
                width: 16,
                height: 16,
                child: Image.asset(champion.traits[i]['icon']),
              ),),
          ],
        )
    );
  }
}