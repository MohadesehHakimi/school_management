import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/appbar_calendar.dart';

class DisplayInfoAppBar extends StatefulWidget {
  const DisplayInfoAppBar({super.key});

  @override
  State<DisplayInfoAppBar> createState() => _DisplayInfoAppBarState();
}

class _DisplayInfoAppBarState extends State<DisplayInfoAppBar> {

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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: const AppBarCalendar(),
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

