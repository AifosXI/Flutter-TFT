import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tft/models/champions.dart';
import 'package:flutter_tft/models/synergies.dart';

class ChampionsList extends StatefulWidget {
  const ChampionsList({super.key});

  @override
  State<ChampionsList> createState() => _ChampionsList();
}

class _ChampionsList extends State<ChampionsList> with AutomaticKeepAliveClientMixin
{
  late Future<List<Champions>> champions;

  @override
  void initState() {
    super.initState();
    champions = Champions(name: '', icon: '', traits: null, fullIcon: '', cost: 0).getAllChampions();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Champions>>(
        future: champions,
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
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                              image: NetworkImage(champions[index].fullIcon),
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
                          bottom: 30,
                          child:
                          DefaultTextStyle(
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'GillSansMT'),
                            child: getChampionTraits(champions[index].traits, champions[index].cost),
                          )
                      )
                    ],
                  ),
                );
              }
          );
        }
    );
  }

  Widget getChampionTraits(traits, cost) {
    return FutureBuilder<List<Synergies>?>(
        future: traits,
        builder: (context, snapshot)
        {
          if(snapshot.hasError) {
            return const Text('Une erreur est survenue, veuillez réessayer.');
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final synergies = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(int i = 0; i < synergies.length; i++ ) Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: customColor(cost),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: Image.network(synergies[i].icon),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Text(synergies[i].name),
                    ],
                  ),
                  const SizedBox(height: 3),
                ],
              )
            ],
          );
        }
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

  @override
  bool get wantKeepAlive => true;
}