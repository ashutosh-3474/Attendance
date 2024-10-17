import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetCourseList {
  static Future<List<Course>> getCourseList(String ProfessorId) async {
    List<Course> courseList = [];

    try {
      
      final snapshot = await FirebaseFirestore.instance
          .collection('ProfessorList')
          .doc(ProfessorId)
          .collection('CourseList')
          .get();
      for (final doc in snapshot.docs) {
        // print("object");
        courseList.add(Course(
          subject: doc['Subject'],
          batch: doc['Batch'],
          branch: doc['Branch'],
        ));
      }
    } catch (e) {
      print(e.toString());
      // Get.snackbar("Error", e.toString());
    }

    return courseList;
  }
}
