# Projet Flutter TFT

Application flutter qui affiche les données du jeu TFT, un mode de jeu créé par Riot Games qui ressemble aux échecs mais avec des champions à la place des pions.

## Getting Started

L'application possède un back en Dart entièrement fait à la main mais tout n'a pas été fait comme la création et modification d'équipe par manque de temps à cause de problèmes survenus pendant le développement. A la connexion on ne verras donc que des exemples d'équipe sur le profil.

Des tests ont été effectué sur Postman, nous pouvons récupérer tout les utilisateurs, nous pouvons également en récupérer un seul ou le supprimer via son ID.

Test postman où l'on récupère les utilisateurs :
![image](https://github.com/AifosXI/Flutter-TFT/assets/88891923/c98110cd-d0f0-4b54-b620-864d3db2e83d)

Test postamn où l'on créé un utilisateur :
![image](https://github.com/AifosXI/Flutter-TFT/assets/88891923/14f97253-a628-4ab7-a577-155d5925c7ea)

Les informations affichées proviennent de plusieurs fichiers JSON conçu par CDragon qui récupère les informations contenues dans le jeu TFT 
- La globalité des informations : https://raw.communitydragon.org/latest/cdragon/tft/fr_fr.json
- Uniquement les synergies : https://raw.communitydragon.org/14.8/plugins/rcp-be-lol-game-data/global/fr_fr/v1/tfttraits.json

## Information à prendre en compte lors des tests

- Nous pouvons émuler l'application sur un vrai téléphone mais nous ne pouvons ni créer de compte ni se connecter pour un refus de connexion cependant, cela fonctionne lorsque l'on émule sur ordinateur.
- Il ne faut pas cliquer sur le dernier emplacement de la BottomNavigationBar avant d'être connecté sinon une erreur sera affichée car nous n'avons pas réussi à tester avec le provider si l'utilisateur est connecté ou non.
- Pour créer un compte il suffit de cliquer sur le bouton au centre avec un plus nous serons ensuite redirigé vers le profil et le dernier bouton de la BottomNavigationBar.

## Setup

Pour que le back Dart puisse se connecter à la base de données il faut ajouter cette ligne dans le fichier .env
```dotenv
DATABASE_URL="mysql://user:password@localhost:3306/dbName"
```
Pour lancer l'API il faut se positionner dans le dossier "api" et lancer les commandes suivantes :
```bash
npm install
dart pub get
npx prisma db push
#Si dart_frog n'est pas reconnu il faut ajouter le cli : dart pub global activate dart_frog_cli
dart_frog dev
```

Créé par STRUYS Wivin, KHALDI Sofia et SCHWALLER Nadia - Étudiants en M2 IW ESGI
