import 'package:attendance/feature_mark_attendance/screen/mark_attendance.dart';
import 'package:attendance/feature_previous_classs_detail/screen/previous_class_detail.dart';
import 'package:attendance/feature_statistics/screens/statistics.dart';
import 'package:awesome_alert/awesome_alert.dart';
import 'package:flutter/material.dart';
import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 11),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarkAttendance(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                )),
            // (
            // child: Ic
            // Icons.add,
            // color: Colors.white,
            // size: 30,
            // ),
          )
        ],
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
              'Subject Subject Subject Subject Subject',
              style: TextStyle(
                  fontFamily: font.dashboardAppbar,
                  color: ColorsVariables.textDashboardAppBar),
            ),
            Text(
              'Batch: 2022 - Branch: CSE',
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
            padding: const EdgeInsets.only(
              left: 11,
              right: 11,
              top: 21,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Statistics(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black12,
                    ),
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/statictics_icon.png",
                          // width: 30,
                          height: 50,
                        ),
                        Text(
                          "Statistics",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/report_icon.png",
                        // width: 30,
                        height: 50,
                      ),
                      Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 11, right: 11, top: 21, bottom: 11),
            child: Text(
              "Previous Classes",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(top: 11, left: 11, right: 11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreviousClassDetail(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        "Date: 10/10/2024\nDay: Sunday",
                        // "${courseList[0]['subject']}\nBatch: ${courseList[0]['batch'].toString()}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            AwesomeAlert awesomeAlert =
                                AwesomeAlert(context: context);
                            awesomeAlert.showAlert(
                              title: "Are you sure?",
                              description:
                                  "Make sure you save the data before deleting this class",
                              confirmText: "Delete",
                              confirmButtonColor: Colors.teal,
                              buttonCornerRadius: 11,
                              confirmAction: () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Pressed")));
                                awesomeAlert.hideAlert();
                              },
                              cancelText: "Back",
                              cancelButtonColor: Colors.black12,
                              cancelAction: () {
                                awesomeAlert.hideAlert();
                              },
                              cancelButtonTextStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            );
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
