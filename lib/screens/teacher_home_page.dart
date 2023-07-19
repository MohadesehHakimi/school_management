import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/display_info_appbar.dart';
import '../widgets/bottom_navigation_bar.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
      //   child: const DisplayInfoAppBar(),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
            child: const DisplayInfoAppBar(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: SingleChildScrollView(
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
                              _buildIconAndLabelColumn(
                                context,
                                FontAwesomeIcons.calendarCheck,
                                'Attendance',
                                Colors.green
                              ),
                              _buildIconAndLabelColumn(
                                context,
                                FontAwesomeIcons.bookBookmark,
                                'Homeworks',
                                Colors.orange
                              ),
                              _buildIconAndLabelColumn(
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
                              _buildIconAndLabelColumn(
                                context,
                                FontAwesomeIcons.calendarDay,
                                'Daily Tests',
                                Colors.orange,
                              ),
                              _buildIconAndLabelColumn(
                                context,
                                FontAwesomeIcons.users,
                                'Activity',
                                Colors.blue,
                              ),
                              _buildIconAndLabelColumn(
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
                              _buildIconAndLabelColumn(
                                context,
                                FontAwesomeIcons.clipboardList,
                                'Time Table',
                                Colors.blue,
                              ),
                              _buildIconAndLabelColumn(
                                context,
                                FontAwesomeIcons.message,
                                'Messages',
                                Colors.purple,
                              ),
                              _buildIconAndLabelColumn(
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
            ),
          ),
        ]
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

Column _buildIconAndLabelColumn(
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
