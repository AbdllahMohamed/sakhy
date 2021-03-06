import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakhy/ui/const/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakhy/ui/styles/styles.dart';
import 'package:sakhy/ui/views/home/nav_home/nav_home_services.dart';
import 'package:sakhy/ui/views/reports/report_controller.dart';

class Spending extends StatefulWidget {
  @override
  _SpendingState createState() => _SpendingState();
}

class _SpendingState extends State<Spending> {
  List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  final Color barBackgroundColor = Colors.transparent;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;
  ReportController _reportController = Get.put(ReportController());

  @override
  void initState() {
    super.initState();
    initValues();
  }

  initValues() async {
    print(DateTime.now().toString().substring(5, 7));
    await _reportController
        .fetchUserReport(DateTime.now().toString().substring(5, 7));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styles.headingText("Spending"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.Alpine,
            size: 20.w,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_today_outlined,
              color: AppColors.Alpine,
              size: 20.w,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: Color(0xFF4F4F4F),
                contentPadding: EdgeInsets.only(left: 10.w, right: 10.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.r),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Center(
                      child: Icon(
                    Icons.logout,
                    color: Colors.grey,
                    size: 20.w,
                  )),
                ),
                title: Text(
                  totalOut.toString() + " SAR",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
                dense: true,
              ),
              Styles.transparentDivider(),
              AspectRatio(
                aspectRatio: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4F4F4F),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7.r),
                    ),
                  ),
                  child: BarChart(
                    isPlaying ? randomData() : mainBarData(),
                    swapAnimationDuration: animDuration,
                  ),
                ),
              ),
              Styles.transparentDivider(),
              Styles.headingText("Total Out"),
              Styles.transparentDivider(),
              Obx(
                () => _reportController.loadingProcess.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.Alpine,
                        ),
                      )
                    : _reportController.fetchUserReportList.isEmpty
                        ? Center(
                            child: Text('Not Found Transactions',
                                style: TextStyle(
                                    color: AppColors.Alpine, fontSize: 16)),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                _reportController.fetchUserReportList.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                // height: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4F4F4F),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.w),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Today",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.sp,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            _reportController
                                                .fetchUserReportList[index]
                                                .creationTime
                                                .substring(5, 10),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Pandah\nSupermarket",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.sp,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            _reportController
                                                    .fetchUserReportList[index]
                                                    .amount +
                                                " SAR",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp,
                                              color: Color(0xFF4DB6AC),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Text(
                                          //   "Rent\nIncom",
                                          //   style: TextStyle(
                                          //       fontWeight: FontWeight.w600,
                                          //       fontSize: 16.sp,
                                          //       color: Colors.white),
                                          // ),
                                          // Text(
                                          //   '+' + totalIn.toString(),
                                          //   style: TextStyle(
                                          //     fontWeight: FontWeight.w600,
                                          //     fontSize: 16.sp,
                                          //     color: Color(0xFF4DB6AC),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Color(0xFF4F4F4F),
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(7.r),
              //     ),
              //   ),
              //   child: Padding(
              //     padding: EdgeInsets.all(20.w),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Today",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 18.sp,
              //                   color: Colors.white),
              //             ),
              //             Text(
              //               "28/8",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w400,
              //                   fontSize: 14.sp,
              //                   color: Colors.white),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 8.h,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Pandah\nSupermarket",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 14.sp,
              //                   color: Colors.white),
              //             ),
              //             Text(
              //               "+500 SAR",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w600,
              //                 fontSize: 14.sp,
              //                 color: Color(0xFF4DB6AC),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 8.h,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Rent\nIncome",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 14.sp,
              //                   color: Colors.white),
              //             ),
              //             Text(
              //               "+1000 SAR",
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w600,
              //                 fontSize: 14.sp,
              //                 color: Color(0xFF4DB6AC),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 5,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow, width: 1)
              : BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 15, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            margin: 16,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'M';
                case 1:
                  return 'T';
                case 2:
                  return 'W';
                case 3:
                  return 'T';
                case 4:
                  return 'F';
                case 5:
                  return 'S';
                case 6:
                  return 'S';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(
            showTitles: false,
          ),
          topTitles: SideTitles(
            showTitles: false,
          ),
          rightTitles: SideTitles(
            showTitles: false,
          )),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor:
                    availableColors[Random().nextInt(availableColors.length)]);
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      await refreshState();
    }
  }
}
