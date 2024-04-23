import 'package:flutter_tft/models/champions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:string_validator/string_validator.dart';

class Synergies {
  String apiName;
  String name;
  String icon;
  String description;
  List step;
  final champions;

  Synergies({
    required this.apiName,
    required this.name,
    required this.icon,
    required this.description,
    required this.step,
    required this.champions,
  });

  List<dynamic>? synergiesList;

  Future<List<Synergies>> getAllSynergies() async {
    final result = await http.get(Uri.parse('https://raw.communitydragon.org/14.8/plugins/rcp-be-lol-game-data/global/fr_fr/v1/tfttraits.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));

    final set11Traits = json;
    final arraySynergies = [];
    var arrayStep = [];
    var arrayChampions;

    for(int i = 0; i < set11Traits.length; i++)
    {
      if(set11Traits[i]['trait_id'].contains('TFT11_'))
      {
        const find = '.tex';
        const replaceWith = '.png';
        const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

        final newIcon = set11Traits[i]['icon_path']?.replaceAll(find, replaceWith).toLowerCase().replaceFirst('/lol-game-data/assets/','');

        for(int j = 0; j < set11Traits[i]['conditional_trait_sets'].length; j++)
        {
          arrayStep.add({
            'minUnit': set11Traits[i]['conditional_trait_sets'][j]['min_units'],
            'type': set11Traits[i]['conditional_trait_sets'][j]['style_name'],
            'description': ''
          });
        }

        if(newIcon != null)
        {
          arrayChampions = getChampionsBySynergy(set11Traits[i]['display_name'], set11Traits[i]['trait_id']);

          arraySynergies.add(
              {
                'name': set11Traits[i]['display_name'],
                'apiName': set11Traits[i]['trait_id'],
                'icon': '$assetsUrl$newIcon',
                'description': set11Traits[i]['tooltip_text'],
                'step': arrayStep,
                'champions': arrayChampions,
              }
          );
        }

        arrayStep = [];
      }
    }

    synergiesList = arraySynergies;
    return List.from(arraySynergies).map((e) => Synergies.fromMap(e)).toList();
  }

  Future<List<Champions>?> getChampionsBySynergy(synergyName, synergyId) async {

    final result = await http.get(Uri.parse('https://raw.communitydragon.org/latest/cdragon/tft/fr_fr.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));
    final set11Champions = json['setData'][2]['champions'];
    final arrayChampions = [];
    const find = '.tex';
    const replaceWith = '.png';
    const assetsUrl = 'https://raw.communitydragon.org/latest/game/';

    final champions = Champions(name: '', icon: '', traits: '', fullIcon: '', cost: 0);

    for(int i = 0; i < set11Champions.length; i++)
    {
      if(set11Champions[i]['apiName'].contains('TFT11_') && set11Champions[i]['traits'].length > 0)
      {
        final arraySynergy = champions.getSynergyByName(set11Champions[i]['traits']);
        for(int j = 0; j < set11Champions[i]['traits'].length; j++){
          if(equals(synergyName, set11Champions[i]['traits'][j]))
          {

            final newSquareIcon = set11Champions[i]['squareIcon']?.replaceAll(find, replaceWith).toLowerCase();
            final newFullIcon = set11Champions[i]['icon']?.replaceAll(find, replaceWith).toLowerCase();

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
      }
    }

    return List.from(arrayChampions).map((e) => Champions.fromMap(e)).toList();
  }

  Synergies.fromMap(Map<String, dynamic> data)
      : apiName = data['apiName'],
        name = data['name'],
        icon = data['icon'],
        description = data['description'],
        step = data['step'],
        champions = data['champions'];
}