import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/class.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key, required this.user});

  final User user;

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> with SingleTickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
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
    return Stack(
      fit: StackFit.expand,
      children: [
        PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: Container(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ],
                center: Alignment.topLeft,
                radius: 1.0,
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.penToSquare),
                  iconSize: 25.0,
                  color: Colors.white,
                ),
                const SizedBox(width: 10.0,),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
                  iconSize: 25.0,
                  color: Colors.white,
                ),
              ],
            )
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.25,
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
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.16,
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                // Personal Info
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Card(
                          elevation: 5.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5.0,),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.user),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Name',),
                                ),
                                subtitle: Text(widget.user.displayName!),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.envelope),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Email',),
                                ),
                                subtitle: Text(widget.user.email!),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.phone),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Phone',),
                                ),
                                subtitle: Text(widget.user.phoneNumber ?? '-'),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.calendar),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Date of Birth',),
                                ),
                                subtitle: const Text('-'),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        Card(
                          elevation: 5.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5.0,),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.idCard),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('ID',),
                                ),
                                subtitle: const Text('-'),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.chalkboardUser),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Subjects',),
                                ),
                                subtitle: const Text('Science, English'),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.book),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Work Experience',),
                                ),
                                subtitle: const Text('5 Years'),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                              ListTile(
                                leading: const FaIcon(FontAwesomeIcons.userGraduate),
                                title: const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text('Education',),
                                ),
                                subtitle: const Text('B.Sc'),
                                iconColor: Theme.of(context).colorScheme.primary,
                                titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                              ),
                            ],
                          )
                        ),
                      ]
                    ),
                  ),
                ),
                // Stats
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Card(
                          elevation: 5.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Performance Report',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                const SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Total Students',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 10.0,),
                                        Text(
                                          '50',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Total Classes',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 10.0,),
                                        Text(
                                          '5',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Total Subjects',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 10.0,),
                                        Text(
                                          '2',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Total Exams',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const SizedBox(height: 10.0,),
                                        Text(
                                          '23',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ),
                        const SizedBox(height: 20.0,),
                        Card(
                          elevation: 5.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'TimeTable',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 16.0),
                                  itemCount: sampleClasses.length,
                                  itemBuilder: (context, index) {
                                    return ExpansionTile(
                                      title: Text(
                                        sampleClasses[index].subject,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '${sampleClasses[index].time.hour}:${sampleClasses[index].time.minute} '
                                            '- ${sampleClasses[index].time.hour + 1}:${sampleClasses[index].time.minute}',
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Class: ',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                sampleClasses[index].room.toString(),
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Section: ',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                sampleClasses[index].section,
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Subject: ',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                sampleClasses[index].subject,
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Time: ',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                sampleClasses[index].time.toString(),
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Teacher: ',
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                sampleClasses[index].teacher,
                                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                ),
                              ],
                            )
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
          left: 0.0,
          right: 0.0,
          bottom: MediaQuery.of(context).size.height * 0.53,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.user.displayName!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Teacher',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TabBar(
                      controller: _tabController,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      indicatorColor: Colors.transparent,
                      labelColor: Theme.of(context).colorScheme.primary,
                      labelStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                      tabs: const [
                        Tab(
                          text: 'Personal',
                        ),
                        Tab(
                          text: 'Stats',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: 0.0,
          right: 0.0,
          bottom: MediaQuery.of(context).size.height * 0.67,
          child: const Material(
            elevation: 5.0,
            shape: CircleBorder(side: BorderSide.none),
            child: CircleAvatar(
              radius: 40.0,
            ),
          )
        ),
      ],
    );
  }
}
