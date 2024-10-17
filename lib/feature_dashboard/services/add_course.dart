import 'dart:async';

import 'package:attendance/feature_course_detail/services/get_previous_classs.dart';
import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class AddCourse {
  static addcourse(
      BuildContext context, Course course, String professorId) async {
    try {
      await FirebaseFirestore.instance
          .collection('ProfessorList')
          .doc(professorId)
          .collection('CourseList')
          .add({
        'Subject': course.subject,
        'Batch': course.batch,
        'Branch': course.branch,
      }).whenComplete(() {
        Navigator.of(context).pop();
      });

      SnackBar snackBar = SnackBar(
        content: Text('Course Added Successfully'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Get.snackbar("title", "message");
      // Get.snackbar('Success', 'Course Added Successfully');
    } catch (e) {
      SnackBar snackBar = SnackBar(
        content: Text('Error Adding Course'),
      );
    }
  }
}

// need to implement whencomplete 
//bcoz page is getting refreshed before adding task is completed. 