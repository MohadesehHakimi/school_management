import 'package:flutter/material.dart';

import '../widgets/calendar_appbar.dart';
import '../widgets/search_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

List<String> students = ['John Doe', 'Jane Doe', 'John Smith', 'Jane Smith',
                            'John Doe', 'Jane Doe', 'John Smith', 'Jane Smith'];

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String _dropDownValue = 'Class 1';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                      // list tile for column titles
                      ListTile(
                        title: Text(
                          'Student Name',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ),
                        trailing: Text(
                          'Present',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        )
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(0.0),
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.grey,
                              child: Text(
                                students[index][0],
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            title: Text(
                              students[index],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            trailing: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Theme.of(context).colorScheme.primary,
                              ),
                              child: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Theme.of(context).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                value: false,
                                onChanged: (bool? value) { },
                              ),
                            )
                          );
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150.0, 40.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2.0,
                              ),
                              backgroundColor: Colors.white,
                              elevation: 0.0,
                            ),
                            child: Text(
                              'Reset',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150.0, 40.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2.0,
                              ),
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              elevation: 0.0,
                            ),
                            child: Text(
                              'Apply',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0,),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: const CustomSearchBar(),
            ),
          ]
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
