import 'package:bw_home_bridge/utils/app_routes.dart';
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
      _selectedIndex = 2;
    }
    // if (AppRoutes.isActiveRouteName(context, AppRoutes.dashboard)) {
    //   _selectedIndex = 3;
    // }
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });

    switch (index) {
      case 0:
        AppRoutes.openNamed(context, AppRoutes.home);
        break;
      case 2:
        AppRoutes.openNamed(context, AppRoutes.dashboard);
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
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(2);
        },
        child: Icon(
          Icons.dashboard_outlined,
          color: Colors.white,
        ),
        backgroundColor:
            _selectedIndex == 2 ? McColors.primary : McColors.black,
        shape: CircleBorder(),
        elevation: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding: EdgeInsets.symmetric(),
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: BottomNavigationBar(
          elevation: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'profile',
            ),

            /// Dash
            BottomNavigationBarItem(
              icon: SizedBox.shrink(),
              activeIcon: SizedBox.shrink(),
              label: '',
            ),
            //
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: McColors.black.withOpacity(.7),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );

    //
  }

  //
}
