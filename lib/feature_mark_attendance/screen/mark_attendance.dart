import 'package:attendance/feature_course_detail/modals/class.dart';
import 'package:attendance/feature_course_detail/modals/student.dart';
import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:attendance/feature_mark_attendance/services/mark_attendance_services.dart';
import 'package:flutter/material.dart';
import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MarkAttendance extends StatefulWidget {
  MarkAttendance({super.key, required this.studentList, required this.course});
  List<Student> studentList;
  Course course;
  @override
  State<MarkAttendance> createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  Map<String, bool> attendence = {};
  DateTime now = DateTime.now();
  // String formattedDate = DateFormat('dd/MM/yyyy - HH:mm:ss').format(now);
  String date = "12-11-2024";
  String day = "Sunday";
  void initState() {
    for (Student student in widget.studentList) {
      attendence[student.id] = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, bool> attendence = {};

    // for (Student student in widget.studentList) {
    //   attendence[student.id] = true;
    // }

    String formattedDate = DateFormat('dd/MM/yyyy - HH:mm:ss').format(now);
    String date = formattedDate.split(" - ")[0];
    for (int i = 0; i < date.length; i++) {
      if (date[i] == '/') {
        date = date.replaceRange(i, i + 1, '-');
      }
    }
    // String day = formattedDate.split(" - ")[1];
    day = DateFormat('EEEE').format(now);
    return Scaffold(
      appBar: AppBar(
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
          Padding(
            padding: EdgeInsets.only(left: 11, right: 11, top: 21, bottom: 11),
            child: Text(
              "Date: $date\nDay: $day",
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
              itemCount: widget.studentList.length + 1,
              itemBuilder: (context, index) {
                if (index == widget.studentList.length) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 21, left: 11, right: 11, bottom: 21),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Class classdetail = Class(
                              date: date, day: day, attendence: attendence);
                          MarkAttendanceServices.markAttendance(
                                  widget.course, classdetail)
                              .whenComplete(() {
                            Navigator.maybePop(context);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                  );
                } else {
                  return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin:
                          const EdgeInsets.only(top: 0, left: 11, right: 11),
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
                            // "${courseList[0]['subject']}\nBatch: ${courseList[0]['batch'].toString()}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              value: attendence[widget.studentList[index].id],
                              onChanged: (bool? newValue) {
                                setState(() {
                                  attendence.update(
                                      widget.studentList[index].id,
                                      (value) => newValue!);
                                  // attendence[widget.studentList[index].id] = newValue!;

                                  print(
                                      attendence[widget.studentList[index].id]);
                                });
                              },
                            ),
                          )));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
