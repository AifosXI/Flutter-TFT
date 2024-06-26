import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tft/models/synergies.dart';

class NewSynergiesData extends StatefulWidget {
  NewSynergiesData({super.key});

  @override
  State<NewSynergiesData> createState() => _NewSynergiesData();
}

class _NewSynergiesData extends State<NewSynergiesData> with AutomaticKeepAliveClientMixin
{
  late Future<List<Synergies>> synergies;

  @override
  void initState() {
    super.initState();
    synergies = Synergies(apiName: '', name: '',description: '', icon: '', step: [], champions: []).getAllSynergies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('De nouvelles synergies !',  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                GestureDetector(
                    onTap: (() => print('Clicked on synergy')),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Voir plus',  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                        Icon(Icons.chevron_right),
                      ],
                    )
                ),
              ],)
        ),
        FutureBuilder<List<Synergies>?>(
            future: synergies,
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                print(snapshot);
                return const Text('Une erreur est survenue, veuillez réessayer.');
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final synergies = snapshot.data!;
              return SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) =>
                          GestureDetector(
                              onTap: (() => print('Clicked')),
                              child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipPath(
                                            clipper: Hexagon(),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Color(0xFF56496b),
                                                      Color(0xFFA26BA2),
                                                      Color(0xFFE188E1),
                                                    ]
                                                ),
                                              ),
                                              child: const SizedBox(
                                                width: 70,
                                                height: 70,
                                              ),
                                            )
                                        ),
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 10,
                                            child: Image.network(synergies[index].icon ?? '', width: 65)
                                        )
                                      ],
                                    ),
                                    Text(synergies[index].name ?? ''),
                                  ]
                              )
                          )
                      ),
                      separatorBuilder: ((context, index) => const SizedBox(width: 10)),
                      itemCount: synergies.length
                  )
              );
            }
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.25, 0);
    path.lineTo(size.width * 0.75, 0);
    path.lineTo(size.width, size.height*sqrt(3)/4);
    path.lineTo(size.width * 0.75, size.height*sqrt(3)/2);
    path.lineTo(size.width * 0.25, size.height*sqrt(3)/2);
    path.lineTo(0, size.height*sqrt(3)/4);
    path.lineTo(size.width * 0.25, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}