import 'package:flutter/material.dart';
import 'package:attendance/common/app_assets/appStrings.dart';
import 'package:attendance/common/app_assets/colors.dart';
import 'package:attendance/common/app_assets/font.dart';
import 'package:attendance/common/variables/variables.dart';

class PreviousClassDetail extends StatelessWidget {
  const PreviousClassDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: 50,
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
                      "Ashutosh Mishra\n2201062CS",
                      // "${courseList[0]['subject']}\nBatch: ${courseList[0]['batch'].toString()}",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      "P",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
