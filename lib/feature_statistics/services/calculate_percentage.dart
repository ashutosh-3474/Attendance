import 'package:attendance/feature_course_detail/modals/class.dart';
import 'package:attendance/feature_course_detail/modals/student.dart';

class CalculatePercentage {
  static Map<String,int> calculatePercentage(List<Class> classList, List<Student> studentList) {
    int total = classList.length;
    Map<String, int> percentage = {};
    for (int i = 0; i < studentList.length; i++) {
      percentage[studentList[i].id] = 0;
    }
    for (Class classdetail in classList) {
      for (int i = 0; i < studentList.length; i++) {
        if (classdetail.attendence[studentList[i].id] == true) {
          percentage[studentList[i].id] = percentage[studentList[i].id]! + 1;
        }
      }
    }
    if (total != 0) {
      for (int i = 0; i < studentList.length; i++) {
        percentage[studentList[i].id] =
            (percentage[studentList[i].id]! / total * 100).toInt();
      }
    }
    return percentage;
  }
}
