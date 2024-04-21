import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tft/models/champions.dart';

class ChampionsList extends StatelessWidget {
  ChampionsList({super.key});

  final List<Champions> champions = Champions('','', [], '',0).champions();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (1/ 0.6),
        ),
        itemCount: champions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (() => print('clicked')),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: AssetImage(champions[index].fullIcon),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: customColor(champions[index].cost),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: DefaultTextStyle(
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12, fontFamily: "GillSansMT"),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(champions[index].name),
                                      Row(children: [
                                        SvgPicture.asset('assets/vectors/coins.svg'),
                                        const SizedBox(width: 2),
                                        Text(champions[index].cost.toString())
                                      ],
                                      )
                                    ],
                                  )
                              )
                          )
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 40,
                    child:
                    DefaultTextStyle(
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'GillSansMT'),
                      child: getChampionTraits(champions[index]),
                    )
                )
              ],
            ),
          );
        }
    );
  }

  Widget getChampionTraits(champion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i = 0; i < champion.traits.length; i++ ) Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: customColor(champion.cost),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: Image.asset(champion.traits[i]['icon']),
                  ),
                ),
                const SizedBox(width: 3),
                Text(champion.traits[i]['name']),
              ],
            ),
            const SizedBox(height: 3),
          ],
        )
      ],
    );
  }

  customColor(cost) {
    switch (cost) {
      case 1 :
        return const Color(0x31414D42);
      case 2 :
        return const Color(0x42156D39);
      case 3 :
        return const Color(0x42266CA5);
      case 4 :
        return const Color(0x42CE0998);
      case 5 :
        return const Color(0x42D8810D);
    }
  }
}