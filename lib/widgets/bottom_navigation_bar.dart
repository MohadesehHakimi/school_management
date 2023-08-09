import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/teacher_home_page.dart';
import '../screens/teacher_profile.dart';

List<Widget> _buildScreens() {
  return [
    const TeacherHomePage(),
    const TeacherHomePage(),
    const TeacherHomePage(),
    const TeacherProfile(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const FaIcon(FontAwesomeIcons.house),
      title: ("Home"),
      activeColorPrimary: Colors.white,
      activeColorSecondary: const Color.fromARGB(255, 21, 113, 236),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(FontAwesomeIcons.message),
      title: ("Messages"),
      activeColorPrimary: Colors.white,
      activeColorSecondary: const Color.fromARGB(255, 21, 113, 236),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(FontAwesomeIcons.bell),
      title: ("Notifications"),
      activeColorPrimary: Colors.white,
      activeColorSecondary: const Color.fromARGB(255, 21, 113, 236),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const FaIcon(FontAwesomeIcons.user),
      title: ("Profile"),
      activeColorPrimary: Colors.white,
      activeColorSecondary: const Color.fromARGB(255, 21, 113, 236),
      inactiveColorPrimary: Colors.white,
    ),
  ];
}

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      navBarHeight: MediaQuery.of(context).size.height * 0.07,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          topLeft: Radius.circular(25.0),
        ),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}
