import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tft/models/synergies.dart';

class SynergiesList extends StatelessWidget {
  SynergiesList({super.key});

  final List<Synergies> synergies = Synergies('', '', '', [], []).synergies();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "GillSansMT"),
          child:Column(
              children: [
                for(int i = 0; i < synergies.length; i++) Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Morgana.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Color(0x1A56496B),
                                  BlendMode.dstATop
                              ),
                            ),
                            color: const Color(0xFF56496B)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(synergies[i].icon),
                                  ),
                                  Text(synergies[i].name, style: const TextStyle(fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(synergies[i].icon),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text('Palier', style: TextStyle(fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 20),
                                      for (int j = 0; j < synergies[i].step.length; j++) Column(
                                        children: [
                                          getSynergyStep(synergies[i].step[j]),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Description', style: TextStyle(fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 20),
                                      SizedBox(width: 180, child: Text(synergies[i].description)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              const Text('Champions', style: TextStyle(fontWeight: FontWeight.w700)),
                              const SizedBox(height: 20),
                              getChampions(synergies[i]),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(synergies[i].icon),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(synergies[i].icon),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ]
          ),
        )
    );
  }

  Widget getChampions(synergy) {
    final championsList = synergy.champions;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        childAspectRatio: (1/ 1.3),
      ),
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: championsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (() => print('champion clicked in synergies')),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(championsList[index].icon),
                  ),
                  Positioned(
                    left: 5,
                    bottom: 5,
                    child: getChampionsTraits(championsList[index], synergy.name),
                  )
                ],
              ),
              const SizedBox(height: 2),
              Text(championsList[index].name),
            ],
          ),
        );
      },
    );
  }

  Widget getChampionsTraits(champion, synergyName) {
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
                    color: champion.traits[i]['name'] == synergyName ? const Color(0xFFF0BE42) : const Color(0xFF56496b),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: Image.asset(champion.traits[i]['icon']),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
          ],
        )
      ],
    );
  }

  Widget getSynergyStep(step) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              color: customColor(step['type'])['color'],
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: customColor(step['type'])['border']),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(step['minUnit'].toString())
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 130,
          child: Text(step['description']),
        ),
      ],
    );
  }

  customColor(type) {
    switch (type) {
      case 'kBronze' :
        return {
          'color': const Color(0xFF6F4939),
          'border': const Color(0xFFD7977B)
        };
      case 'kSilver' :
        return {
          'color': const Color(0xFF858585),
          'border': const Color(0xFFCCCACA)
        };
      case 'kGold' :
        return {
          'color' : const Color(0xFFA27207),
          'border' : const Color(0xFFE5A109)
        };
      case 'kRainbow':
        return {
          'color': const Color(0xFF07A26C),
          'border': const Color(0xFF12E199)
        };
    }
  }
}