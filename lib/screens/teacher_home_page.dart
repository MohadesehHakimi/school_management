import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/display_info_appbar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../models/class.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> with SingleTickerProviderStateMixin{

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                    TabBar(
                      padding: const EdgeInsets.only(top: 15.0),
                      indicator: UnderlineTabIndicator(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 3.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        insets: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      labelColor: Theme.of(context).colorScheme.primary,
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Updates',),
                        Tab(text: 'Monthly'),
                        Tab(text: 'Events'),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: TabBarView(
                        controller: _tabController,
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
                                const SizedBox(height: 20.0,),
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
                                const SizedBox(height: 20.0,),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upcoming Period',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const Text(
                                      'View All',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ]
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: sampleClasses.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor: Colors.grey,
                                          child: Text(
                                            sampleClasses[index].subject[0],
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                        title: Text(
                                          sampleClasses[index].subject,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        subtitle: Text(
                                          "${sampleClasses[index].grade}th Grade "
                                              "${sampleClasses[index].section} Section",
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        trailing: Text(
                                          "${sampleClasses[index].time.hour}:"
                                              "${sampleClasses[index].time.minute}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          const Text('Monthly'),
                          const Text('Events')
                        ]
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
