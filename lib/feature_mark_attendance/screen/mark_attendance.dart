import 'package:flutter/material.dart';
import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';

class MarkAttendance extends StatelessWidget {
  const MarkAttendance({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.only(left: 11, right: 11, top: 21, bottom: 11),
            child: Text(
              "Date: 10/10/2024\nDay: Sunday",
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
              itemCount: 50 + 1,
              itemBuilder: (context, index) {
                if (index == 50) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: 21, left: 11, right: 11, bottom: 21),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
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
                            "Ashutosh Mishra\n2201062CS",
                            // "${courseList[0]['subject']}\nBatch: ${courseList[0]['batch'].toString()}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          trailing: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: true,
                                onChanged: null,
                              ))));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
