import 'package:cloud_firestore/cloud_firestore.dart';

class DataController {
  Future<String> getData() async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc('seecsUg')
        .get();
    final data = document.data();
    final firstFloor = data?['floor']?['first'];
    final secondFloor = data?['floor']?['second'];
    final dean = data?['dean'];
    final department = data?['department'];
    final history = data?['history'];

    String text = '';

    if (dean != null) {
      text += 'Dean: $dean\n';
    }

    if (department != null) {
      text += 'Department: ${department.toString()}\n';
    }

    if (history != null) {
      text += 'History: $history\n';
    }

    if (firstFloor != null) {
      // Extract data from firstFloor and format it
      final classrooms = firstFloor['classrooms'];
      final labs = firstFloor['labs'];
      final facilities = firstFloor['facilities'];
      final facultyOffices = firstFloor['facultyOffices'];

      text += '\nFirst Floor:\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
    }

    if (secondFloor != null) {
      // Extract data from secondFloor and format it
      final classrooms = secondFloor['classrooms'];
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      final facultyOffices = secondFloor['facultyOffices'];

      text += '\nSecond Floor:\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
    }

    return text;
  }
}
