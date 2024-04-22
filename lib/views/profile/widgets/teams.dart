import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tft/models/champions.dart';
import 'package:flutter_tft/models/teams.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ceci est une page de démonstration, nous n\'avons pas eu le temps de tout terminer à cause de quelques problèmes survenus durant le dévelopemment' , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "GillSansMT", fontStyle: FontStyle.italic)),
            const Text('Mes compositions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: "GillSansMT")),
            const SizedBox(height: 20),
            DefaultTextStyle(
                style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "GillSansMT"),
                child: FutureBuilder<List<Teams>>(
                  future: Teams(name: '', bgImage: '', synergies:[], champions:[]).getTeamsForExample(),

                  builder: (context, snapshot) {
                    if(snapshot.hasError) {
                      return const Text('Une erreur est survenue, veuillez réessayer.', style: TextStyle(color: Colors.red),);
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final teams = snapshot.data!;
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: teams.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(teams[index].bgImage),
                                    fit: BoxFit.cover,
                                    colorFilter: const ColorFilter.mode(
                                        Color(0x3356496B),
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
                                      Text(teams[index].name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                      TextButton(
                                        onPressed: (() => print('button edit')),
                                        style: const ButtonStyle(
                                            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
                                            minimumSize: MaterialStatePropertyAll(Size(28, 28)),
                                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: const Color(0xFF56496b)
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(Icons.edit_outlined, color: Colors.white, size: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  // Row(
                                  //   mainAxisSize: MainAxisSize.max,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     getSynergy(teams[index].synergies),
                                  //   ],
                                  // ),
                                  const SizedBox(height: 20),
                                  getChampions(teams[index].champions),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: ( context, index) => const SizedBox(height: 20),
                    );
                  },
                )

            )
          ],
        )
    );
  }

  Widget getChampions(championsList) {
    return FutureBuilder<List<Champions>?>
      (
        future: championsList,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return const Text('Une erreur est survenue, veuillez réessayer.');
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final champions = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: (1/ 1.4),
            ),
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: champions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (() => print('champion clicked in synergies')),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(champions[index].icon),
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
                                    child: Text(champions[index].name, textAlign: TextAlign.center),
                                  ),
                                ),
                              )
                          ),
                          // Text(championsList[0]['champion'][index].name),
                        )
                      ],
                    ),
                    // getChampionsItems(championsList[index]['items'])
                  ],
                ),
              );
            },
          );
        }
    );
  }

  Widget getChampionsItems(items) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < items.length; i++ ) Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 22,
                  width: 22,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(items[i].icon),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget getSynergy(synergy) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for(int i = 0; i < synergy.length; i++) Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF56496B),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Image.asset(synergy[i]['synergy'].icon, width: 20),
                    const SizedBox(width: 5),
                    Text(synergy[i]['number'].toString(), style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14, fontFamily: 'GillSansMT'),)
                  ],
                )
            ),
            const SizedBox(width: 10),
          ],
        )
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