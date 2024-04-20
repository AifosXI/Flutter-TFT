class Synergies {
  String name;
  String icon;

  Synergies(
      this.name,
      this.icon,
      );

  List<Synergies> synergies() {
    return [
      Synergies(
          'Fantôme',
          'assets/images/Ghostly.png',
      ),
      Synergies(
          'Sniper',
          'assets/images/Sniper.png',
      ),
      Synergies(
          'Sage',
          'assets/images/Sage.png',
      ),
      Synergies(
          'Ombre',
          'assets/images/Umbral.png',
      ),
      Synergies(
          'Bagarreur',
          'assets/images/Bruiser.png',
      ),
      Synergies(
          'Faucheur',
          'assets/images/Reaper.png',
      ),
    ];
  }
}