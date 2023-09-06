import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../providers/picked_date_provider.dart';

DateTime mostRecentMonday(DateTime date) =>
    DateTime(date.year, date.month, date.day - (date.weekday - 1));

class CustomAppBarCalendar extends ConsumerStatefulWidget {
  const CustomAppBarCalendar({super.key});

  @override
  ConsumerState<CustomAppBarCalendar> createState() => _CustomAppBarCalendarState();
}

class _CustomAppBarCalendarState extends ConsumerState<CustomAppBarCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    _selectedDay = ref.watch(pickedDateProvider);

    return TableCalendar(
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
          ref.read(pickedDateProvider.notifier).changeDate(selectedDay);
          setState(() {
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
        outsideBuilder: (context, date, _) {
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
      ),
    );
  }
}
