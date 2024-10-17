import 'package:attendance/feature_dashboard/modals/course.dart';
import 'package:attendance/feature_dashboard/services/add_course.dart';
import 'package:flutter/material.dart';

void add_course(BuildContext context) {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Course'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: 'Course Name',
                ),
              ),
              TextField(
                controller: batchController,
                decoration: InputDecoration(
                  labelText: 'Batch',
                ),
              ),
              TextField(
                controller: branchController,
                decoration: InputDecoration(
                  labelText: 'Branch',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle cancel button press
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle add course button press
                Course course = Course(
                  subject: courseController.text,
                  batch: batchController.text,
                  branch: branchController.text,
                );
                AddCourse.addcourse(context,course, '001');

                // Do something with the input data
                // print('Course: $courseName, Batch: $batch, Branch: $branch');

                Navigator.of(context).pop();
              },
              child: Text('Add Course'),
            ),
          ],
        );
      });
}
