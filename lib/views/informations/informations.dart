import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tft/views/home/widgets/title.dart';
import 'package:flutter_tft/views/informations/widgets/champions.dart';
import 'package:flutter_tft/views/informations/widgets/synergies.dart';

class Informations extends StatelessWidget {
  static String routeName = '/informations';

  const Informations({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              title: const CustomTitle("SET 11 - Fables des encres", 17),
              titleSpacing: 0,
              bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Champions'),
                    Tab(text: 'Synergies'),
                    Tab(text: 'Items'),
                  ]
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: TabBarView(
                children: [
                  ChampionsList(),
                  SynergiesList(),
                  const Center(child: Text('Items')),
                ],
              ),
            )
        )
    );
  }
}