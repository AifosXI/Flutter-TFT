import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tft/models/synergies.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../models/champions.dart';

class SynergiesList extends StatefulWidget {
  SynergiesList({super.key});

  @override
  State<SynergiesList> createState() => _SynergiesList();
}

class _SynergiesList extends State<SynergiesList> with AutomaticKeepAliveClientMixin
{
  late Future<List<Synergies>> synergies;

  @override
  void initState() {
    super.initState();
    synergies = Synergies(apiName: '', name: '',description: '', icon: '', step: [], champions: []).getAllSynergies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
        child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: "GillSansMT"),
            child: FutureBuilder<List<Synergies>>(
              future: synergies,
              builder: (context, snapshot) {
                if(snapshot.hasError) {
                  return const Text('Une erreur est survenue, veuillez réessayer.');
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final synergies = snapshot.data!;
                return Column(
                    children: [
                      for(int i = 0; i < synergies.length; i++) Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/bg_synergy.png'),
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
                                          child: Image.network(synergies[i].icon),
                                        ),
                                        Text(synergies[i].name, style: const TextStyle(fontWeight: FontWeight.w700, color: const Color(0xFF56496B))),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.network(synergies[i].icon),
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
                                            const SizedBox(height: 30),
                                            for (int j = 0; j < synergies[i].step.length; j++) Row(
                                              children: [
                                                SizedBox(width: 150, child: getSynergyStep(synergies[i].step[j]),),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const Text('Description', style: TextStyle(fontWeight: FontWeight.w700)),
                                            const SizedBox(height: 20),
                                            SizedBox(width: 180, child: HtmlWidget(synergies[i].description)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    const Text('Champions', style: TextStyle(fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 20),
                                    getChampions(synergies[i].champions, synergies[i].name),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.network(synergies[i].icon),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Image.network(synergies[i].icon),
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
                );
              },
            )
        )
    );
  }

  Widget getChampions(champions, synergyName) {
    return FutureBuilder<List<Champions>?>
      (
        future: champions,
        builder: (context, snapshot) {

          if(snapshot.hasError) {
            return const Text('Une erreur est survenue, veuillez réessayer.');
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          }

          final championsList = snapshot.data!;

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
                          child: Image.network(championsList[index].icon),
                        ),
                        Positioned(
                          left: 5,
                          bottom: 5,
                          child: getChampionsTraits(championsList[index].traits, synergyName),
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
    );
  }

  Widget getChampionsTraits(traits, synergyName) {
    return FutureBuilder<List<Synergies>?>(
        future: traits,
        builder: (context, snapshot){
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
                          color: synergies[i].name == synergyName ? const Color(0xFFF0BE42) : const Color(0xFF56496b),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: Image.network(synergies[i].icon),
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
    );

  }

  Widget getSynergyStep(step) {
    return Column(
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
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(step['minUnit'].toString())
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
      case 'kChromatic':
        return {
          'color': const Color(0xFF07A26C),
          'border': const Color(0xFF12E199)
        };
      case 'kUnique':
        return {
          'color': const Color(0xFFE16214),
          'border': const Color(0xFFEE7F41)
        };
    }
  }

  @override
  bool get wantKeepAlive => true;
}