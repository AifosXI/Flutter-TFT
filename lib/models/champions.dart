import 'dart:convert';
import 'package:flutter_tft/models/synergies.dart';
import 'package:http/http.dart' as http;
import 'package:string_validator/string_validator.dart';

class Champions {
  final String name;
  final String icon;
  final String fullIcon;
  final int cost;
  final traits;

  Champions({
    required this.name,
    required this.icon,
    required this.traits,
    required this.fullIcon,
    required this.cost,
  });

  Champions.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        icon = data['icon'],
        traits = data['traits'],
        fullIcon = data['fullIcon'],
        cost = data['cost'];

  Future<List<Champions>> getAllChampions() async {
    final result = await http.get(Uri.parse('https://raw.communitydragon.org/latest/cdragon/tft/fr_fr.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));
    final set11Champions = json['setData'][2]['champions'];
    final arrayChampions = [];

    for(int i = 0; i < set11Champions.length; i++)
    {
      if(set11Champions[i]['apiName'].contains('TFT11_') && set11Champions[i]['traits'].length > 0)
      {
        const find = '.tex';
        const replaceWith = '.png';
        const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

        final newSquareIcon = set11Champions[i]['squareIcon']?.replaceAll(find, replaceWith).toLowerCase();
        final newFullIcon = set11Champions[i]['icon']?.replaceAll(find, replaceWith).toLowerCase();
        final arraySynergy = getSynergyByName(set11Champions[i]['traits']);

        if(newFullIcon != null && newSquareIcon != null && !newFullIcon.contains('template') &&!newSquareIcon.contains('template') )
        {
          arrayChampions.add(
              {
                'name': set11Champions[i]['name'],
                'icon': '$assetsUrl$newSquareIcon',
                'traits': arraySynergy,
                'fullIcon': '$assetsUrl$newFullIcon',
                'cost': set11Champions[i]['cost'],

              }
          );
        }
      }
    }

    return List.from(arrayChampions).map((e) => Champions.fromMap(e)).toList();
  }

  Future<List<Synergies>?> getSynergyByName(arraySynergy) async {
    final result = await http.get(Uri.parse('https://raw.communitydragon.org/14.8/plugins/rcp-be-lol-game-data/global/fr_fr/v1/tfttraits.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));

    final set11Traits = json;
    var arraySynergies = [];

    const find = '.tex';
    const replaceWith = '.png';
    const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

    for(int i = 0; i < set11Traits.length; i++)
    {
      if(set11Traits[i]['trait_id'].contains('TFT11_'))
      {
        for(int j = 0; j < arraySynergy.length; j++){
          if(equals(set11Traits[i]['display_name'],arraySynergy[j]))
          {
            var newIcon = set11Traits[i]['icon_path']?.replaceAll(find, replaceWith).toLowerCase().replaceFirst('/lol-game-data/assets/','');

            if(newIcon != null)
            {
              arraySynergies.add(
                  {
                    'name': set11Traits[i]['display_name'],
                    'apiName': set11Traits[i]['trait_id'],
                    'icon': '$assetsUrl$newIcon',
                    'description': '',
                    'step': [],
                    'champions': [],
                  }
              );
            }
          }
        }
      }
    }

    return List.from(arraySynergies).map((e) => Synergies.fromMap(e)).toList();
  }

}