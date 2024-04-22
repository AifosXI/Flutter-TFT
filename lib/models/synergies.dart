import 'package:http/http.dart' as http;
import 'dart:convert';

class Synergies {
  String? apiName;
  String? name;
  String? icon;
  String? description;
  List? step;
  List<dynamic>? champions;

  Synergies({
    required this.apiName,
    required this.name,
    required this.icon,
    required this.description,
    required this.step,
    required this.champions,
  });

  List<dynamic>? synergiesList;

  Future<List<Synergies>?> getAllSynergies() async {
    final result = await http.get(Uri.parse('https://raw.communitydragon.org/latest/cdragon/tft/fr_fr.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));

    final set11Traits = json['setData'][2]['traits'];
    final arraySynergies = [];

    for(int i = 0; i < set11Traits.length; i++)
    {
      if(set11Traits[i]['apiName'].contains('TFT11_'))
      {
        const find = '.tex';
        const replaceWith = '.png';
        const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

        final newIcon = set11Traits[i]['icon']?.replaceAll(find, replaceWith).toLowerCase();

        if(newIcon != null)
        {
          arraySynergies.add(
              {
                'name': set11Traits[i]['name'],
                'apiName': set11Traits[i]['apiName'],
                'icon': '$assetsUrl$newIcon',
                'description': set11Traits[i]['desc'],
                'step': [
                  {
                    'description': '5% par spectre',
                    'minUnit': 2,
                    'type': 'kBronze'
                  },
                  {
                    'description': '5% par spectre',
                    'minUnit': 4,
                    'type': 'kSilver'
                  },
                  {
                    'description': '5% par spectre',
                    'minUnit': 6,
                    'type': 'kGold'
                  },
                  {
                    'description': '5% par spectre',
                    'minUnit': 8,
                    'type': 'kGold'
                  }
                ],
                'champions': []

              }
          );
        }
      }
    }
    synergiesList = arraySynergies;
    return List.from(arraySynergies).map((e) => Synergies.fromMap(e)).toList();
  }

  Future<List<Synergies>?> getSynergyByName(arraySynergy) async {
    final result = await http.get(Uri.parse('https://raw.communitydragon.org/latest/cdragon/tft/fr_fr.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));

    final set11Traits = json['setData'][2]['traits'];
    final arraySynergies = [];

    for(int i = 0; i < set11Traits.length; i++)
    {
      for(int j = 0; j < arraySynergy.length; j++){

        if(set11Traits[i]['name'].contains(arraySynergy[j]))
        {
          if(set11Traits[i]['apiName'].contains('TFT11_'))
          {
            const find = '.tex';
            const replaceWith = '.png';
            const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

            final newIcon = set11Traits[i]['icon']?.replaceAll(find, replaceWith).toLowerCase();

            if(newIcon != null)
            {
              arraySynergies.add(
                  {
                    'name': set11Traits[i]['name'],
                    'apiName': set11Traits[i]['apiName'],
                    'icon': '$assetsUrl$newIcon',
                    'description': set11Traits[i]['desc'],
                    'step': [
                      {
                        'description': '5% par spectre',
                        'minUnit': 2,
                        'type': 'kBronze'
                      },
                      {
                        'description': '5% par spectre',
                        'minUnit': 4,
                        'type': 'kSilver'
                      },
                      {
                        'description': '5% par spectre',
                        'minUnit': 6,
                        'type': 'kGold'
                      },
                      {
                        'description': '5% par spectre',
                        'minUnit': 8,
                        'type': 'kGold'
                      }
                    ],
                    'champions': []

                  }
              );
            }
          }
        }
      }


    }
    synergiesList = arraySynergies;
    return List.from(arraySynergies).map((e) => Synergies.fromMap(e)).toList();
  }

  Synergies.fromMap(Map<String, dynamic> data)
      : apiName = data['apiName'],
        name = data['name'],
        icon = data['icon'],
        description = data['description'],
        step = data['step'],
        champions = data['champions'];
}