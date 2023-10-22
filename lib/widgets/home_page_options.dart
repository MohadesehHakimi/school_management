import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/teacher_attendance_page.dart';
import '../screens/student_attendance_page.dart';

Column buildOptionsTable(BuildContext context, String userType) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.calendarCheck,
            'Attendance',
            Colors.green,
            () {
              switch (userType) {
                case 'teacher':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherAttendancePage(),
                    ),
                  );
                  break;
                case 'student':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentAttendancePage(),
                    ),
                  );
                  break;
                case 'staff':

                  break;
                default:
              }
            },
          ),
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.bookBookmark,
            'Homeworks',
            Colors.orange,
              () {},
          ),
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.userCheck,
            'Behavior',
            Colors.purple,
              () {},
          ),
        ],
      ),
      const SizedBox(height: 20.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.calendarDay,
            'Daily Tests',
            Colors.orange,
              () {},
          ),
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.users,
            'Activity',
            Colors.blue,
              () {},
          ),
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.clockRotateLeft,
            'Circulars',
            Colors.green,
              () {},
          ),
        ],
      ),
      const SizedBox(height: 20.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.clipboardList,
            'Time Table',
            Colors.blue,
              () {},
          ),
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.message,
            'Messages',
            Colors.purple,
              () {},
          ),
          _buildIconAndLabelColumn(
            context,
            FontAwesomeIcons.ellipsis,
            'More',
            Colors.blue,
              () {},
          ),
        ],
      ),
    ],
  );
}

Column _buildIconAndLabelColumn(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    VoidCallback operation,
    ) {
  return Column(
    children: [
      IconButton(
        onPressed: operation,
        icon: FaIcon(icon),
        color: color,
        iconSize: 40.0,
      ),
      const SizedBox(height: 5.0,),
      Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium,
      )
    ],
  );
}