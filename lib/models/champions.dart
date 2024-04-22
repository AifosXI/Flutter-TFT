import 'dart:convert';
import 'package:flutter_tft/models/synergies.dart';
import 'package:http/http.dart' as http;

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
    required this.cost
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

    final synergies = Synergies(apiName: '', name: '', icon: '', description: '', step: [], champions: []);

    for(int i = 0; i < set11Champions.length; i++)
    {
      if(set11Champions[i]['apiName'].contains('TFT11_'))
      {
        const find = '.tex';
        const replaceWith = '.png';
        const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

        final newSquareIcon = set11Champions[i]['squareIcon']?.replaceAll(find, replaceWith).toLowerCase();
        final newFullIcon = set11Champions[i]['icon']?.replaceAll(find, replaceWith).toLowerCase();

        final tmp = synergies.getSynergyByName(set11Champions[i]['traits']);

        if(newFullIcon != null && newSquareIcon != null && !newFullIcon.contains('template') &&!newSquareIcon.contains('template') )
        {
          arrayChampions.add(
              {
                'name': set11Champions[i]['name'],
                'icon': '$assetsUrl$newSquareIcon',
                'traits': tmp,
                'fullIcon': '$assetsUrl$newFullIcon',
                'cost': set11Champions[i]['cost']

              }
          );
        }
      }
    }
    return List.from(arrayChampions).map((e) => Champions.fromMap(e)).toList();
  }
}