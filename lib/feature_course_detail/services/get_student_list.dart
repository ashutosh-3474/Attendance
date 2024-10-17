import 'package:attendance/feature_course_detail/modals/student.dart';
import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetStudentList {
  static Future<List<Student>> getStudentList(
      String batch, String branch) async {
    List<Student> studentList = [];
    // print("called");
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('StudentList')
          .doc('2022')
          .collection('CSE')
          .get();
      for (final doc in snapshot.docs) {
        // print("hii");
        studentList.add(Student(
          name: doc['Name'],
          id: doc.reference.id,
        ));
      }
    } catch (e) {
      print(e.toString());
      // Get.snackbar("Error", e.toString());
    }

    return studentList;
  }
}
