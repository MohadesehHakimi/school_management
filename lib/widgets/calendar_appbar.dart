import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

DateTime mostRecentMonday(DateTime date) =>
    DateTime(date.year, date.month, date.day - (date.weekday - 1));

class CalendarAppBar extends StatefulWidget {
  const CalendarAppBar({super.key});

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
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
          const SizedBox(height: 15.0,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: TableCalendar(
              shouldFillViewport: true,
              headerVisible: false,
              daysOfWeekVisible: false,
              calendarFormat: CalendarFormat.week,
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: _focusedDay,
              // display this week, from Mon to Sun
              firstDay: mostRecentMonday(DateTime.now()),
              lastDay: mostRecentMonday(DateTime.now()).add(
                  const Duration(days: 6)),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = selectedDay;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
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
                  // if today is selected or no date is selected
                  if (isSameDay(date, _selectedDay) || _selectedDay == null) {
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
                  } else {
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
                  }
                },
                disabledBuilder: (context, date, _) {
                  return const SizedBox.shrink();
                },
                selectedBuilder: (context, date, _) {
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
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          const Divider(
            color: Colors.white60,
            thickness: 1.0,
            indent: 10.0,
            endIndent: 10.0,
            height: 1.0,
          ),
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
