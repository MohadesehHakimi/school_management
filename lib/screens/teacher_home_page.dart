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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.calendarCheck),
                            color: Colors.green,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Attendance',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.bookBookmark),
                            color: Colors.orange,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Homeworks',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.userCheck),
                            color: Colors.purple,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Behavior',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.calendarDay),
                            color: Colors.orange,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Daily Tests',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.users),
                            color: Colors.blue,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Activity',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
                            color: Colors.green,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Circulars',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.clipboardList),
                            color: Colors.blue,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Time Table',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.message),
                            color: Colors.purple,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Messages',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const FaIcon(FontAwesomeIcons.ellipsis),
                            color: Colors.blue,
                            iconSize: 40.0,
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'More',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    ],
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
