import 'package:flutter/material.dart';

import '../widgets/calendar_appbar.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String _dropDownValue = 'Class 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
            child: const CalendarAppBar(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
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
                top: 45.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Attendance',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '14/06/2023  |  Wednesday',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    height: 30.0,
                  ),
                  DropdownButtonFormField(
                    padding: const EdgeInsets.all(10.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    value: _dropDownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropDownValue = newValue!;
                      });
                    },
                    items: <String>['Class 1', 'Class 2', 'Class 3', 'Class 4',
                      'Class 5', 'Class 6', 'Class 7', 'Class 8', 'Class 9', 'Class 10']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    indent: 10.0,
                    endIndent: 10.0,
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0.0,
            right: 0.0,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Theme(
                data: ThemeData(
                    inputDecorationTheme: const InputDecorationTheme(
                      fillColor: Colors.white,
                    )
                ),
                child: Material(  // use material widget to add elevation
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                      filled: true,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            )
          ),
        ]
      ),
    );
  }
}
