import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/user_provider.dart';
import '../../providers/user_type_provider.dart';
import '../../providers/picked_date_provider.dart';
import '../../widgets/display_info_appbar.dart';
import '../../widgets/home_page_options.dart';
import '../../widgets/search_bar.dart';
import '../../models/class.dart';
import '../../models/event.dart';

class StudentHomePage extends ConsumerStatefulWidget {
  const StudentHomePage({super.key});

  @override
  ConsumerState<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends ConsumerState<StudentHomePage> with SingleTickerProviderStateMixin {

  late final TabController _tabController;
  User? user;
  DateTime date = DateTime.now();

  void setDate(DateTime newDate) {
    ref.read(pickedDateProvider.notifier).changeDate(newDate);
  }

  @override
  void initState() {
    super.initState();
    user = ref.read(userProvider);
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    date = ref.watch(pickedDateProvider);
    user = ref.watch(userProvider)!;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
          fit: StackFit.expand,
          children: [
            // AppBar
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
                        height: MediaQuery.of(context).size.height * 0.6 + sampleClasses.length * 65.0,
                        child: TabBarView(
                            controller: _tabController,
                            children: [
                              // Updates
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    buildOptionsTable(context, ref.read(userTypeProvider)),
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
                                    buildClassesListView(),
                                  ],
                                ),
                              ),
                              // Monthly
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                child: buildOptionsTable(context, ref.read(userTypeProvider)),
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
                                          'Events on ${DateFormat.MMMM().format(date)} '
                                              '${date.day}, '
                                              '${date.year}',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                      ],
                                    ),
                                    buildEventsListView(),
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
            // Search Bar
            Positioned(
              top: MediaQuery.of(context).size.height * 0.42,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: const CustomSearchBar(),
            ),
          ]
      ),
    );
  }
}

Widget buildClassesListView() {
  return sampleClasses.isEmpty ?
  const Column(
    children: [
      SizedBox(height: 80.0,),
      Text(
        'No Classes Yet!',  // fallback message
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    ],
  ) :
  ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
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
  );
}

Widget buildEventsListView() {
  return sampleEvents.isEmpty ?
  const Column(
    children: [
      SizedBox(height: 100.0,),
      Text(
        'No Events Yet!',  // fallback message
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    ],
  ) :
  ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
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
  );
}
