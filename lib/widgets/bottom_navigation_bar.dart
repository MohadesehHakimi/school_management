import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/teacher_mainPage_tabs_provider.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends ConsumerState<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    ref.read(teacherHomepageTabsProvider.notifier).changeTab(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bell),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedFontSize: 16.0,
          unselectedFontSize: 14.0,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
