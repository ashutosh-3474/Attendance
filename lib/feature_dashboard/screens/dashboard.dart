import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';
import 'package:attendance/feature_course_detail/screens/course_detail.dart';
import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:attendance/feature_dashboard/screens/add_course_popup.dart';
import 'package:attendance/feature_dashboard/services/get_course_list.dart';
import 'package:awesome_alert/awesome_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dashboard extends StatefulWidget {
  dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  bool isLoading = false;
  List<Course> courseList = [];

  @override
  void initState() {
    getCourseList();
    super.initState();
  }

  void getCourseList() async {
    setState(() {
      isLoading = true;
    });
    courseList = await GetCourseList.getCourseList("001");
    setState(() {
      isLoading = false;
      // print(courseList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 11),
            child: IconButton(
                onPressed: () {
                  // AlertDialog add_course = AddCourse(con);
                  add_course(context);
                  //   .then((_){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
                  //   });
                  // initState();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => AddCourse()));
                },
                icon: Icon(Icons.add, color: Colors.white, size: 30)),
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : courseList.isEmpty
              ? const Center(
                  child: Text("No Course Found"),
                )
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 11, right: 11, top: 21, bottom: 11),
                      child: Text(
                        appStrings.dashboardCourseListTitle,
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: courseList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: const EdgeInsets.only(
                                top: 11, left: 11, right: 11),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black12,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseDetail(
                                      course: courseList[index],
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  "${courseList[index].subject}\nBatch: ${courseList[index].batch}              Branch: ${courseList[index].branch}",
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
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text("Pressed")));
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
