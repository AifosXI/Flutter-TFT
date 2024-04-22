import 'package:flutter/material.dart';
import 'package:flutter_tft/models/champions.dart';

import '../../../models/synergies.dart';

class NewChampionsData extends StatelessWidget {
  NewChampionsData({super.key});

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
                const Text('De nouveaux champions !',  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                GestureDetector(
                    onTap: (() => print('Clicked on champions')),
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
        FutureBuilder<List<Champions>>(
            future: Champions(
                name: '',
                icon: '',
                traits: null,
                fullIcon: '', cost: 0).getAllChampions(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return const Text('Une erreur est survenue, veuillez réessayer.');
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final champions = snapshot.data!;
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
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: SizedBox(
                                            width: 75,
                                            height: 75,
                                            child: Image.network(champions[index].icon),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          bottom: 2,
                                          child: getChampionsTraits(champions[index].traits),
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
              );
            }
        )
      ],
    );
  }

  Widget getChampionsTraits(traits) {
    return FutureBuilder<List<Synergies>?>(
        future: traits,
        builder: (context, snapshot)
        {
          if(snapshot.hasError) {
            return const Text('Une erreur est survenue, veuillez réessayer.');
          }
          if (!snapshot.hasData) {
            return const Center(child: SizedBox(width: 16, child: CircularProgressIndicator()));
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
                          color: const Color(0xFF56496b),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: Image.network(synergies[i].icon ?? ''),
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
}