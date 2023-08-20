import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:school_management/widgets/custom_appbar_calendar.dart';


class CalendarAppBar extends StatefulWidget {
  const CalendarAppBar({super.key});

  @override
  State<CalendarAppBar> createState() => _CalendarAppBarState();
}

class _CalendarAppBarState extends State<CalendarAppBar> {

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
        gradient: RadialGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
          ],
          center: Alignment.topLeft,
          radius: 1.0,
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
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                      //   return TeacherMainPage(user: user);
                      // }));
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  Text(
                    'Select Date:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    DateFormat.yMMMM().format(DateTime.now()),
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
            child: CustomAppBarCalendar(onDateChange: () {},),
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
