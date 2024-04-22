import 'package:flutter/cupertino.dart';
import 'package:flutter_tft/models/champions.dart';
import 'package:flutter_tft/models/items.dart';
import 'package:flutter_tft/models/synergies.dart';

class Teams {
  String name;
  String bgImage;
  List synergies;
  final champions;

  Teams({
    required this.name,
    required this.bgImage,
    required this.synergies,
    required this.champions,
  });

  Future<List<Teams>> getTeamsForExample() async {
    final synergy = Synergies(apiName: '', name: '', icon: '', description: '', step: [], champions: []);

    final teamsSynergy = [
      {
        "name": 'Fantôme',
        "bgImage": 'tft11_morgana.tft_set11.png',
      },
      {
        "name": 'Porcelaine',
        "bgImage": 'tft11_lissandra.tft_set11.png',
      },
      {
        "name": "Guerrier d'encre",
        "bgImage": "tft11_udyr.tft_set11.png"
      }
    ];

    final arrayTeams = [];

    for(int i = 0; i < teamsSynergy.length; i++)
    {
      arrayTeams.add(
          {
            "name": "Démonstration équipe - ${teamsSynergy[i]['name']}",
            "bgImage": "https://raw.communitydragon.org/latest/game/assets/ux/tft/championsplashes/${teamsSynergy[i]['bgImage']}",
            "synergies": [teamsSynergy[i]],
            "champions": synergy.getChampionsBySynergy(teamsSynergy[i]['name'], '')
          });
    }
    return List.from(arrayTeams).map((e) => Teams.fromMap(e)).toList();
  }

  Teams.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        bgImage = data['bgImage'],
        synergies = data['synergies'],
        champions = data['champions'];
}