import 'package:flutter/cupertino.dart';
import 'package:flutter_tft/models/champions.dart';
import 'package:flutter_tft/models/items.dart';
import 'package:flutter_tft/models/synergies.dart';

class Teams {
  String name;
  String bgImage;
  List synergies;
  List<Map<dynamic, dynamic>> champions;

  Teams(
      this.name,
      this.bgImage,
      this.synergies,
      this.champions,
      );

  List<Teams> teams() {
    return [
      Teams(
          'Ghostly Morgana Kayn Carry',
          'assets/images/Caitlyn_full.png',
          [
            {
              'synergy': Synergies(apiName: 'TFT11_',name: 'Ghostly', icon: 'assets/images/Ghostly.png', description: '', step: [] ,champions:[]),
              'number': 4
            },
            {
              'synergy':  Synergies(apiName: 'TFT11_',name: 'Porcelain', icon: 'assets/images/Porcelain.png', description: '', step: [] ,champions:[]),
              'number': 4
            },
            {
              'synergy':  Synergies(apiName: 'TFT11_',name: 'Reaper', icon: 'assets/images/Reaper.png', description: '', step: [] ,champions:[]),
              'number': 2
            },
            {
              'synergy':  Synergies(apiName: 'TFT11_',name: 'Bruiser', icon: 'assets/images/Bruiser.png', description: '', step: [] ,champions:[]),
              'number': 2
            },
          ],
          [
            {
              'champion':'',
              'items': [
                Items(
                    'Morellonomicon',
                    'assets/images/Morellonomicon.png',
                    [
                      'assets/images/GiantsBelt.png',
                      'assets/images/NeedlesslyLargeRod.png',
                    ],
                    'Description Morello'
                ),
                Items(
                    'Lame enragée de Guinsoo',
                    'assets/images/GuinsoosRageblade.png',
                    [
                      'assets/images/NeedlesslyLargeRod.png',
                      'assets/images/RecurveBow.png',
                    ],
                    'Les attaques du porteur lui octroient 5% de vitesse d\'attaque (effet cumulable).'
                ),
              ]
            },
          ]
      ),
    ];
  }
}