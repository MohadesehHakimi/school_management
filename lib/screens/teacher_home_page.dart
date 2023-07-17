import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../widgets/bottom_navigation_bar.dart';

DateTime mostRecentMonday(DateTime date) =>
    DateTime(date.year, date.month, date.day - (date.weekday - 1));

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
        child: Container(
          padding: const EdgeInsets.only(
              top: 50.0,
              left: 20.0,
              right: 20.0,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ernest Hemingway',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 5.0,),
                      Text(
                        'ID: 12345 | Teacher',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  // const SizedBox(width: 60.0,),
                  Row(
                    children: [
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
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.white60,
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        'June 2022',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      const SizedBox(width: 5.0,),
                      const FaIcon(
                        FontAwesomeIcons.calendarDays,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      const SizedBox(width: 5.0,),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0,),
              Expanded(
                child: TableCalendar(
                  shouldFillViewport: true,
                  headerVisible: false,
                  daysOfWeekVisible: false,
                  calendarFormat: CalendarFormat.week,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  focusedDay: DateTime.now(),
                  // display this week, from Mon to Sun
                  firstDay: mostRecentMonday(DateTime.now()),
                  lastDay: mostRecentMonday(DateTime.now()).add(
                      const Duration(days: 7)),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              DateFormat('EEE').format(date),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text(
                              date.day.toString(),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    todayBuilder: (context, date, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              DateFormat('EEE').format(date),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 5.0,),
                            Text(
                              date.day.toString(),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    // disabledBuilder: (context, date, _) {
                    //   return const SizedBox.shrink();
                    // },
                  ),
                ),
              ),
              const SizedBox(height: 30.0,),
              const Divider(
                color: Colors.white60,
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
                height: 10.0,
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
