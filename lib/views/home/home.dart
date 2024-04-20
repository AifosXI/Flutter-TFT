import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tft/views/home/widgets/new-champions.dart';
import 'package:flutter_tft/views/home/widgets/new-synergies.dart';
import 'package:flutter_tft/views/home/widgets/title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: 50,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset('assets/images/home_banner.jpg'),
                  const CustomTitle(),
                  Container(
                    padding: const EdgeInsets.only(
                        right: 10,
                        left: 10
                    ),
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
        ),
        bottomNavigationBar: navigationBar()
    );
  }

  Widget navigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      //this is very important, without it the whole screen will be blurred
      child: ClipRect(
        //I'm using BackdropFilter for the blurring effect
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 7.8,
            sigmaY: 7.8,
          ),
          child: Opacity(
            //you can change the opacity to whatever suits you best
              opacity: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: const BoxDecoration(
                  color: Color(0x4256496b),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  border: Border(top: BorderSide(color: Color(0xFF56496b), width: 3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.home, color: Colors.white, size: 40),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset('assets/vectors/add-round.svg'),
                    ),
                    const SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(Icons.account_circle_rounded, color: Colors.white, size: 40),
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
