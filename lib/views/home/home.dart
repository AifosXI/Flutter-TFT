import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tft/views/auth/signin_view.dart';
import 'package:flutter_tft/views/auth/signup_view.dart';
import 'package:flutter_tft/views/home/homepage_content.dart';
import 'package:flutter_tft/views/informations/informations.dart';
import 'package:flutter_tft/views/profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  final List<Widget> _widgetOptions = <Widget>[
    const HomepageContent(),
    const Informations(),
    const SignupView(),
    const Informations(),
    SigninView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: buildNavigator(),
        bottomNavigationBar: navigationBar(context)
    );
  }

  Widget navigationBar(context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF56496b),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items:
      [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, color: Colors.white, size: 35),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/champions.svg', width: 30,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/add-round.svg', width: 30,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/vectors/synergies.svg', width: 30,),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded, color: Colors.white, size: 35),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings setting) {
        if(setting.name != "/") {
          switch(setting.name) {
            case "signup":
              return MaterialPageRoute(builder: (_) => const SignupView());

            case "signin":
              return MaterialPageRoute(builder: (_) => SigninView());

            case "profile":
              return MaterialPageRoute(builder: (_) => ProfileView());
          }
        } else {
          return MaterialPageRoute(builder: (_) => _widgetOptions.elementAt(_selectedIndex));
        }
      },
    );
  }
}
