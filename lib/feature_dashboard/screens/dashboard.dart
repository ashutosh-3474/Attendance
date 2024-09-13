import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';
import 'package:attendance/feature_course_detail/screens/course_detail.dart';
import 'package:awesome_alert/awesome_alert.dart';
import 'package:flutter/material.dart';

class dashboard extends StatelessWidget {
  dashboard({super.key});
  List<Map<String, dynamic>> courseList = [
    {'subject': 'Software Engineering ', 'batch': '2022', 'branch': 'CSE'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 11),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
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
        title: Text(
          'Hi,\n${Variables.dashboardUserName}',
          style: TextStyle(
              fontFamily: font.dashboardAppbar,
              color: ColorsVariables.textDashboardAppBar),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 11, right: 11, top: 21, bottom: 11),
            child: Text(
              appStrings.dashboardCourseListTitle,
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
                          builder: (context) => CourseDetail(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        "${courseList[0]['subject']}\nBatch: ${courseList[0]['batch']}              Branch: ${courseList[0]['branch']}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            AwesomeAlert awesomeAlert =
                                AwesomeAlert(context: context);
                            awesomeAlert.showAlert(
                              title: "Are you sure?",
                              description:
                                  "Make sure you save the data before deleting course",
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
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                          )),
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
