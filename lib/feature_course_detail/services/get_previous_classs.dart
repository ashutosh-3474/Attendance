import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:attendance/feature_course_detail/modals/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetPreviousClassList {
  static Future<List<Class>> getPreviousClassList(Course course) async {
    List<Class> classList = [];

    try {
      // print ("getpreviousclasslist called");
      final snapshot = await FirebaseFirestore.instance
          .collection('Attendance')
          .doc(course.batch)
          .collection(course.branch)
          .doc('1')
          .collection(course.subject)
          .get();
      for (final doc in snapshot.docs) {
        // print("object class list");
        classList.add(Class(
          date: doc.reference.id,
          day: doc['Day'],
          attendence: doc['Attendance'],
        ));
      }
    } catch (e) {
      print(e.toString());
      // Get.snackbar("Error", e.toString());
    }

    return classList;
  }
}
