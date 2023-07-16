import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/bottom_navigation_bar.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: Container(
          padding: const EdgeInsets.only(
              top: 50.0,
              left: 25.0,
              right: 15.0,
              bottom: 20.0,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Ernest Hemingway',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5.0,),
                      Text(
                        'ID: 12345 | Teacher',
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                  const SizedBox(width: 60.0,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.bell),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.bars),
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
