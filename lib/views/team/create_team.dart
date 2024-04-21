import 'package:flutter/material.dart';
import 'package:flutter_tft/views/team/board_view.dart';

import '../home/widgets/title.dart';

class CreateTeam extends StatelessWidget {
  static String routeName = '/create-team';

  const CreateTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              title: const CustomTitle("Création d'une équipe", 17),
              titleSpacing: 0,
              bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Board'),
                    Tab(text: 'Résumé'),
                  ]
              ),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: const TabBarView(
                children: [
                  BoardView(),
                  Text('Résumé')
                ],
              ),
            )
        )
    );
  }
}