import 'dart:ffi';

class Items {
  String name;
  String icon;
  List composition;
  String effect;

  Items(
      this.name,
      this.icon,
      this.composition,
      this.effect,
      );

  List<Items> items() {
    return [
      Items(
          'Lame enragée de Guinsoo',
          'assets/images/GuinsoosRageblade.png',
          [
            'assets/images/NeedlesslyLargeRod.png',
            'assets/images/RecurveBow.png',
          ],
          'Les attaques du porteur lui octroient 5% de vitesse d\'attaque (effet cumulable).'
      ),
      Items(
          'Morellonomicon',
          'assets/images/Morellonomicon.png',
          [
            'assets/images/GiantsBelt.png',
            'assets/images/NeedlesslyLargeRod.png',
          ],
          'Description Morello'
      ),
    ];
  }
}