import 'dart:ffi';

class Champions {
  String name;
  String icon;
  String fullIcon;
  int cost;
  List<Map<String, String>> traits;

  Champions(
      this.name,
      this.icon,
      this.traits,
      this.fullIcon,
      this.cost,
      );

  List<Champions> champions() {
    return [
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
      ),
      Champions(
          'Sylas',
          'assets/images/Sylas.png',
          [
            {'name': 'Ombre', 'icon': 'assets/images/Umbral.png'},
            {'name': 'Bagarreur', 'icon': 'assets/images/Bruiser.png'},
          ],
        'assets/images/Caitlyn_full.png',
        4
      ),
      Champions(
          'Kayn',
          'assets/images/Kayn.png',
          [
            {'name': 'Ombre', 'icon': 'assets/images/Umbral.png'},
            {'name': 'Faucheur', 'icon': 'assets/images/Reaper.png'},
          ],
        'assets/images/Caitlyn_full.png',
        4
      ),
      Champions(
          'Lissandra',
          'assets/images/Lissandra.png',
          [
            {'name': 'Porcelaine', 'icon': 'assets/images/Porcelain.png'},
            {'name': 'Arcaniste', 'icon': 'assets/images/Arcanist.png'},
          ],
        'assets/images/Caitlyn_full.png',
        5
      )
    ];
  }
}