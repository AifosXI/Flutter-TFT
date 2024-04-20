class Champions {
  String name;
  String icon;
  List<Map<String, String>> traits;

  Champions(
      this.name,
      this.icon,
      this.traits
      );

  List<Champions> champions() {
    return [
      Champions(
          'Caitlyn',
          'assets/images/Caitlyn.png',
          [
            {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
            {'name': 'Sniper', 'icon': 'assets/images/Sniper.png'},
          ]
      ),
      Champions(
          'Morgana',
          'assets/images/Morgana.png',
          [
            {'name': 'Fantôme', 'icon': 'assets/images/Ghostly.png'},
            {'name': 'Sage', 'icon': 'assets/images/Sage.png'},
          ]
      ),
      Champions(
          'Sylas',
          'assets/images/Sylas.png',
          [
            {'name': 'Ombre', 'icon': 'assets/images/Umbral.png'},
            {'name': 'Bagarreur', 'icon': 'assets/images/Bruiser.png'},
          ]
      ),
      Champions(
          'Kayn',
          'assets/images/Kayn.png',
          [
            {'name': 'Ombre', 'icon': 'assets/images/Umbral.png'},
            {'name': 'Faucheur', 'icon': 'assets/images/Reaper.png'},
          ]
      ),
      Champions(
          'Lissandra',
          'assets/images/Lissandra.png',
          [
            {'name': 'Porcelaine', 'icon': 'assets/images/Porcelain.png'},
            {'name': 'Arcaniste', 'icon': 'assets/images/Arcanist.png'},
          ]
      )
    ];
  }
}