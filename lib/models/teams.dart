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
              'synergy': Synergies('Ghostly', 'assets/images/Ghostly.png','', [] , []),
              'number': 4
            },
            {
              'synergy':  Synergies('Porcelain', 'assets/images/Porcelain.png','', [] , []),
              'number': 4
            },
            {
              'synergy':  Synergies('Reaper', 'assets/images/Reaper.png','', [] , []),
              'number': 2
            },
            {
              'synergy':  Synergies('Bruiser', 'assets/images/Bruiser.png','', [] , []),
              'number': 2
            },
          ],
          [
            {
              'champion':
              Champions(
                  'Morgana',
                  'assets/images/Morgana.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
            {
              'champion':
              Champions(
                  'Kayn',
                  'assets/images/Kayn.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
            {
              'champion':
              Champions(
                  'Caitlyn',
                  'assets/images/Caitlyn.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
              'items': [
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
            {
              'champion':
              Champions(
                  'Lissandra',
                  'assets/images/Lissandra.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
            {
              'champion':
              Champions(
                  'Sylas',
                  'assets/images/Sylas.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
      Teams(
          'Test',
          'assets/images/Caitlyn_full.png',
          [
            {
              'synergy': Synergies('Ghostly', 'assets/images/Ghostly.png','', [] , []),
              'number': 4
            },
            {
              'synergy':  Synergies('Porcelain', 'assets/images/Porcelain.png','', [] , []),
              'number': 4
            },
            {
              'synergy':  Synergies('Reaper', 'assets/images/Reaper.png','', [] , []),
              'number': 2
            },
            {
              'synergy':  Synergies('Bruiser', 'assets/images/Bruiser.png','', [] , []),
              'number': 2
            },
          ],
          [
            {
              'champion':
              Champions(
                  'Morgana',
                  'assets/images/Morgana.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
            {
              'champion':
              Champions(
                  'Kayn',
                  'assets/images/Kayn.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
            {
              'champion':
              Champions(
                  'Caitlyn',
                  'assets/images/Caitlyn.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
              'items': [
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
            {
              'champion':
              Champions(
                  'Lissandra',
                  'assets/images/Lissandra.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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
            {
              'champion':
              Champions(
                  'Sylas',
                  'assets/images/Sylas.png',
                  [
                    {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
                    {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                  ],
                  'assets/images/Caitlyn_full.png',
                  4
              ),
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