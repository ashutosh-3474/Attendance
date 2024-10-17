import 'package:attendance/feature_course_detail/modals/class.dart';
import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MarkAttendanceServices {
  static Future<void> markAttendance(Course course, Class classdetail) async {
    try {
      // print("getpreviousclasslist called");
      final snapshot = await FirebaseFirestore.instance
          .collection('Attendance')
          .doc(course.batch)
          .collection(course.branch)
          .doc('1')
          .collection(course.subject)
          .doc(classdetail.date)
          .set({
        'Day': classdetail.day,
        'Attendance': classdetail.attendence,
      });
      //     .add({
      //   'Day': classdetail.day,
      //   'Attendance': classdetail.attendence,
      // });
    } catch (e) {
      print(e.toString());
      // Get.snackbar("Error", e.toString());
    }
  }
}
