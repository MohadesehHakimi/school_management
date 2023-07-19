import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/display_info_appbar.dart';
import '../widgets/bottom_navigation_bar.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
        child: const DisplayInfoAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIconAndLabelColumn(
                          context,
                          FontAwesomeIcons.calendarCheck,
                          'Attendance',
                          Colors.green
                      ),
                      buildIconAndLabelColumn(
                          context,
                          FontAwesomeIcons.bookBookmark,
                          'Homeworks',
                          Colors.orange
                      ),
                      buildIconAndLabelColumn(
                          context,
                          FontAwesomeIcons.userCheck,
                          'Behavior',
                          Colors.purple
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIconAndLabelColumn(
                        context,
                        FontAwesomeIcons.calendarDay,
                        'Daily Tests',
                        Colors.orange,
                      ),
                      buildIconAndLabelColumn(
                        context,
                        FontAwesomeIcons.users,
                        'Activity',
                        Colors.blue,
                      ),
                      buildIconAndLabelColumn(
                        context,
                        FontAwesomeIcons.clockRotateLeft,
                        'Circulars',
                        Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildIconAndLabelColumn(
                        context,
                        FontAwesomeIcons.clipboardList,
                        'Time Table',
                        Colors.blue,
                      ),
                      buildIconAndLabelColumn(
                        context,
                        FontAwesomeIcons.message,
                        'Messages',
                        Colors.purple,
                      ),
                      buildIconAndLabelColumn(
                        context,
                        FontAwesomeIcons.ellipsis,
                        'More',
                        Colors.blue,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    height: 50.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

Column buildIconAndLabelColumn(
    BuildContext context,
    IconData icon,
    String label,
    Color color) {
  return Column(
    children: [
      IconButton(
        onPressed: () {},
        icon: FaIcon(icon),
        color: color,
        iconSize: 40.0,
      ),
      const SizedBox(height: 5.0,),
      Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium,
      )
    ],
  );
}
