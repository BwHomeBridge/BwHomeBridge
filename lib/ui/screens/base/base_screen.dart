import 'package:bw_home_bridge/utils/app_routes.dart';
import 'package:bw_home_bridge/utils/constants.dart';
import 'package:bw_home_bridge/utils/mc_colors.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  BaseScreen({required this.child, required String title});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  active() {
    if (AppRoutes.isActiveRouteName(context, AppRoutes.home)) {
      _selectedIndex = 0;
    }
    // if (AppRoutes.isActiveRouteName(context, AppRoutes.home)) {
    //   _selectedIndex = 1;
    // }
    if (AppRoutes.isActiveRouteName(context, AppRoutes.dashboard)) {
      _selectedIndex = 1;
    }
    if (AppRoutes.isActiveRouteName(context, AppRoutes.profile)) {
      _selectedIndex = 2;
    }
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });

    switch (index) {
      case 0:
        AppRoutes.openNamed(context, AppRoutes.home);
        break;
      case 1:
        AppRoutes.openNamed(context, AppRoutes.dashboard);
        break;
      case 2:
        AppRoutes.openNamed(context, AppRoutes.profile);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    active();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage('assets/images/logo.png'),
              width: 55,
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          widget.child,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 199, 186, 186),
                      spreadRadius: -10,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'Dash',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: McColors.primary,
                    onTap: _onItemTapped,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    //
  }

  //
}
