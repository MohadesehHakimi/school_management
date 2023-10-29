import 'package:flutter/material.dart';

import '../../models/class.dart';
import '../../screens/signup_page.dart';
import '../../widgets/bottom_navigation_bar.dart';
import '../../widgets/title_appbar.dart';

class StudentTimetablePage extends StatelessWidget {
  const StudentTimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: const TitleAppBar(title: 'Timetable'),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
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
                bottom: 10.0,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(0.0),
                      itemCount: sampleClasses.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  capitalize(sampleClasses[index].day.name),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                              Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  columnWidths: const {
                                    0: FlexColumnWidth(2.5),
                                    1: FlexColumnWidth(1.0),
                                  },
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        sampleClasses[index].subject,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${sampleClasses[index].time.hour}:"
                                        "${sampleClasses[index].time.minute}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ]),
                                    const TableRow(children: [
                                      SizedBox(height: 10.0),
                                      SizedBox(height: 10.0),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        sampleClasses[index].teacher,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        "Grade ${sampleClasses[index].grade}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ]),
                                    const TableRow(children: [
                                      SizedBox(height: 10.0),
                                      SizedBox(height: 10.0),
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "Section ${sampleClasses[index].section}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        "Room ${sampleClasses[index].room}",
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ]),
                                  ]),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Theme.of(context).colorScheme.secondary,
                          height: 15.0,
                          thickness: 1.0,
                          indent: 15.0,
                          endIndent: 15.0,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
