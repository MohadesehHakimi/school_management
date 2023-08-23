import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.2,
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
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
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
                                  child: Text('Subject',),
                                ),
                                subtitle: const Text('Science'),
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
                                subtitle: const Text('5'),
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
                const Center(
                  child: Text('Stats'),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.13,
          left: 0.0,
          right: 0.0,
          bottom: MediaQuery.of(context).size.height * 0.58,
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
          top: MediaQuery.of(context).size.height * 0.08,
          left: 0.0,
          right: 0.0,
          bottom: MediaQuery.of(context).size.height * 0.72,
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
