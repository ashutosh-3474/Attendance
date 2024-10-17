import 'package:attendance/feature_course_detail/modals/class.dart';
import 'package:attendance/feature_course_detail/modals/student.dart';
import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:attendance/feature_statistics/services/calculate_percentage.dart';
import 'package:flutter/material.dart';
import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';

class Statistics extends StatefulWidget {
  Statistics({super.key, required this.studentList, required this.course,required this.classList});
  List<Student> studentList;
  Course course;
  List<Class> classList;

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Map<String, int> percentage = {};
  
  @override
  Widget build(BuildContext context) {
    percentage = CalculatePercentage.calculatePercentage(widget.classList, widget.studentList);
    return Scaffold(
      appBar: AppBar(
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.only(right: 11),
        //     child: Icon(
        //       Icons.add,
        //       color: Colors.white,
        //       size: 30,
        //     ),
        //   )
        // ],
        backgroundColor: ColorsVariables.dashboardAppBarColor,
        toolbarHeight: Variables()
            .dashboardAppBarHeight(MediaQuery.of(context).size.height),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Variables.dashboardAppBarRadius),
            bottomRight: Radius.circular(Variables.dashboardAppBarRadius),
          ),
        ),
        title: Column(
          // mainAxisAlignment: MainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.course.subject,
              style: TextStyle(
                  fontFamily: font.dashboardAppbar,
                  color: ColorsVariables.textDashboardAppBar),
            ),
            Text(
              'Batch: ${widget.course.batch} - Branch: ${widget.course.branch}',
              style: TextStyle(
                  fontFamily: font.dashboardAppbar,
                  color: ColorsVariables.textDashboardAppBar),
            ),
          ],
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 11, right: 11, top: 21, bottom: 11),
            child: Text(
              "Statistics",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: widget.studentList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(top: 0, left: 11, right: 11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    // color: Colors.black12,
                  ),
                  child: ListTile(
                    leading: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    title: Text(
                      "${widget.studentList[index].name}\n${widget.studentList[index].id}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      '${percentage[widget.studentList[index].id]}%',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),
          // Divider(
          //   color: Colors.white,
          // )
          // SizedBox(
          //   height: 5,
          // )
        ],
      ),
    );
  }
}
