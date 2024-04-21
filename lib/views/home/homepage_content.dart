import 'package:flutter/material.dart';
import 'package:flutter_tft/views/home/widgets/new-champions.dart';
import 'package:flutter_tft/views/home/widgets/new-synergies.dart';
import 'package:flutter_tft/views/home/widgets/title.dart';

class HomepageContent extends StatelessWidget {
  const HomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: (kBottomNavigationBarHeight + 20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset('assets/images/home_banner.jpg'),
                const CustomTitle("Introduction", 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const Text("TFT est un jeu développé par Riot Games, l’entreprise qui a développé le jeu League of Legends. \n\nTFT est un jeu d’échec mais avec des champions à la place !\n\nTout les 4 mois environ, un nouveau set sort avec de nouveaux champions et des nouvelles synergies !"),
                      NewChampionsData(),
                      NewSynergiesData(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
