import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/title_appbar.dart';
import '../widgets/bottom_navigation_bar.dart';

List<Map<String, List<int>>> sampleAttendance = [
  {'September 2023':
      [26, 26, 4],
  },
  {'October 2023':
      [21, 26, 3],
  }  
];

class AttendanceStudentPage extends StatelessWidget {
  const AttendanceStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: const TitleAppBar(title: 'Attendance'),
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
                      itemCount: sampleAttendance.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sampleAttendance[index].keys.first,
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.23,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: SfCircularChart(
                                        annotations: [
                                          CircularChartAnnotation(
                                            widget: Text(
                                              '${sampleAttendance[index].values.first[0]}',
                                              style: const TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            verticalAlignment: ChartAlignment.far,
                                          ),
                                          CircularChartAnnotation(
                                            widget: Text(
                                              'Days Present',
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                color: Colors.grey[600],
                                              )
                                            ),
                                            verticalAlignment: ChartAlignment.near,
                                          ),
                                        ],
                                        palette: [
                                          Theme.of(context).colorScheme.primary,
                                          Colors.white,
                                        ],
                                        series: <CircularSeries>[
                                          DoughnutSeries<double, double>(
                                            dataSource: <double>[
                                              sampleAttendance[index].values.first[0] /
                                                  sampleAttendance[index].values.first[1] * 100,
                                              100 -
                                                  sampleAttendance[index].values.first[0] /
                                                      sampleAttendance[index].values.first[1] * 100,
                                            ],
                                            xValueMapper: (double data, _) => data,
                                            yValueMapper: (double data, _) => data,
                                            radius: '80%',
                                            innerRadius: '85%',
                                            startAngle: 285,
                                            endAngle: 285,
                                            cornerStyle: CornerStyle.bothCurve,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Working Days',
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          )
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          '${sampleAttendance[index].values.first[1]} Days',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Text(
                                          'Official Leaves',
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          )
                                        ),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          '${sampleAttendance[index].values.first[2]} Days',
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 50.0,
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color: Colors.grey[300],
                        );
                      },
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
