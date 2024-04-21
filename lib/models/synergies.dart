import 'champions.dart';

class Synergies {
  String name;
  String icon;
  String description;
  List step;
  List<Champions> champions;

  Synergies(
      this.name,
      this.icon,
      this.description,
      this.step,
      this.champions,
      );

  List<Synergies> synergies() {
    return [
      Synergies(
          'Fantôme',
          'assets/images/Ghostly.png',
        'Vous gagnez des objets de Guerrier d\'encre uniques.\nLes Guerriers d\'encre gagnent un bonus de dégâts et de réduction des dégâts.',
        [
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
            'type': 'kRainbow'
          }
        ],
        [
          Champions(
              'Caitlyn',
              'assets/images/Caitlyn.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
              ],
              'assets/images/Caitlyn_full.png',
              1
          ),
          Champions(
              'Morgana',
              'assets/images/Morgana.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
              ],
              'assets/images/Caitlyn_full.png',
              4
          ),Champions(
            'Caitlyn',
            'assets/images/Caitlyn.png',
            [
              {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
              {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
            ],
            'assets/images/Caitlyn_full.png',
            1
        ),
          Champions(
              'Morgana',
              'assets/images/Morgana.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
              ],
              'assets/images/Caitlyn_full.png',
              4
          ),Champions(
            'Caitlyn',
            'assets/images/Caitlyn.png',
            [
              {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
              {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
            ],
            'assets/images/Caitlyn_full.png',
            1
        ),
          Champions(
              'Morgana',
              'assets/images/Morgana.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
              ],
              'assets/images/Caitlyn_full.png',
              4
          ),
        ]
      ),
      Synergies(
          'Sniper',
          'assets/images/Sniper.png',
          'Description sniper',
          [
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
          [
          Champions(
              'Caitlyn',
              'assets/images/Caitlyn.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
              ],
              'assets/images/Caitlyn_full.png',
              1
          ),
        ]
      ),
      Synergies(
          'Sage',
          'assets/images/Sage.png',
          'Description sage',
          [
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
        [
          Champions(
              'Caitlyn',
              'assets/images/Caitlyn.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
              ],
              'assets/images/Caitlyn_full.png',
              1
          ),
        ]
      ),
      Synergies(
          'Ombre',
          'assets/images/Umbral.png',
          'Description ombre',
          [
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
        [
          Champions(
              'Caitlyn',
              'assets/images/Caitlyn.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
              ],
              'assets/images/Caitlyn_full.png',
              1
          ),
        ]
      ),
      Synergies(
          'Bagarreur',
          'assets/images/Bruiser.png',
          'Description bagarreur',
          [
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
        [
          Champions(
              'Caitlyn',
              'assets/images/Caitlyn.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
              ],
              'assets/images/Caitlyn_full.png',
              1
          ),
        ]
      ),
      Synergies(
          'Faucheur',
          'assets/images/Reaper.png',
          'Description faucheur',
          [
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
        [
          Champions(
              'Caitlyn',
              'assets/images/Caitlyn.png',
              [
                {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
                {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
              ],
              'assets/images/Caitlyn_full.png',
              1
          ),
        ]
      ),
    ];
  }
}