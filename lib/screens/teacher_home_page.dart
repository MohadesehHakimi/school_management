import 'package:flutter/material.dart';

import '../widgets/display_info_appbar.dart';
import '../widgets/home_page_options.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../models/class.dart';
import '../models/event.dart';

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
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TabBar(
                      padding: const EdgeInsets.only(top: 10.0),
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
                          // Updates
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                buildOptionsTable(context),
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
                          // Monthly
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: buildOptionsTable(context),
                          ),
                          // Events
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Events on July 20, 2023',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: sampleEvents.length,
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
                                            sampleEvents[index].title[0],
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                        title: Text(
                                          sampleEvents[index].title,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        subtitle: Text(
                                          "${sampleEvents[index].grade}th Grade "
                                              "${sampleEvents[index].section} Section",
                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        trailing: Text(
                                          "${sampleEvents[index].time.hour}:"
                                              "${sampleEvents[index].time.minute}",
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: 0.0,
            right: 0.0,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Theme(
                data: ThemeData(
                  inputDecorationTheme: const InputDecorationTheme(
                    fillColor: Colors.white,
                  )
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                    filled: true,
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                  ),
                ),
              ),
            )
          ),
        ]
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
