import 'dart:convert';
import 'package:http/http.dart' as http;

class Items {
  String name;
  String icon;
  List composition;
  String effect;

  Items({
    required this.name,
    required this.icon,
    required this.composition,
    required this.effect,
  });

  Items.fromMap(Map<String, dynamic> data)
      : name = data['name'],
        icon = data['icon'],
        composition = data['composition'],
        effect = data['effect'];

  Future<List<Items>> getAllItems() async {
    final result = await http.get(Uri.parse('https://raw.communitydragon.org/latest/cdragon/tft/fr_fr.json'));

    final json = jsonDecode(utf8.decode(result.bodyBytes));
    final setItems = json['items'];
    final arrayItems = [];

    for(int i = 0; i < setItems.length; i++)
    {
      if(setItems[i]['apiName'].contains('TFT_Item') && setItems[i]['composition'].length > 0 && !setItems[i]['apiName'].contains('HextechChestguard') && !setItems[i]['apiName'].contains('CursedBlade'))
      {
        const find = '.tex';
        const replaceWith = '.png';
        const assetsUrl = 'https://raw.communitydragon.org/latest/game/';
        const assetsUrlComposition = 'https://raw.communitydragon.org/latest/game/assets/maps/particles/tft/item_icons/standard/';

        final newSquareIcon = setItems[i]['icon']?.replaceAll(find, replaceWith).toLowerCase();
        final firstCompositionItem = setItems[i]['composition'][0]?.replaceAll(find, replaceWith).replaceAll('TFT_Item_','');
        final secondCompositionItem = setItems[i]['composition'][1]?.replaceAll(find, replaceWith).replaceAll('TFT_Item_','');

        final regexKey = RegExp(r'(?<=@)[^]*?(?=@)');

        late String finalDesc = '';

        setItems[i]['effects'].forEach((key, effect) {
          var regex2 = regexKey.firstMatch(setItems[i]['desc'])?.group(0) ?? '';

          if(regex2 != '')
          {
            if(setItems[i]['desc'].contains(key) && regex2.replaceAll('*100', '') == key)
            {
              if(regex2.contains('*'))
              {
                finalDesc = setItems[i]['desc'].replaceAll(key, (double.parse(effect.toStringAsFixed(2))*100).toString());
              } else {
                finalDesc = setItems[i]['desc'].replaceAll(key, effect.toString());
              }

            }
          }
        });

        final finalDescReplaced = finalDesc.replaceAll('@','').replaceAll('100','').replaceAll('*','');

        if(newSquareIcon != null)
        {
          arrayItems.add(
              {
                'name': setItems[i]['name'],
                'icon': '$assetsUrl$newSquareIcon',
                'composition': [
                  '$assetsUrlComposition${transformPascalCase(firstCompositionItem)}',
                  '$assetsUrlComposition${transformPascalCase(secondCompositionItem)}',
                ],
                'effect': finalDescReplaced ?? '',
              }
          );
        }
      }
    }

    return List.from(arrayItems).map((e) => Items.fromMap(e)).toList();
  }

  String transformPascalCase(String string)
  {
    final beforeNonLeadingCapitalLetter = RegExp(r"(?=(?!^)[A-Z])");
    final listString = string.split(beforeNonLeadingCapitalLetter);
    String finaleString = '';

    for(int i =0; i < listString.length; i++)
    {
      finaleString += '${listString[i]}_';
    }

    finaleString = finaleString.substring(0, finaleString.length - 1);

    if(finaleString == 'B_F_Sword')
    {
      finaleString = 'BF_Sword.png';
    } else if(finaleString == 'Giants_Belt')
    {
      finaleString = 'gaints_belt.png';
    }
    else {
      finaleString = '$finaleString.png';
    }

    final lowerCaseFinal = finaleString.toLowerCase();

    return lowerCaseFinal;
  }
}