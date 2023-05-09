import 'package:cloud_firestore/cloud_firestore.dart';

class DataController {
  Future<String> getFirstFloors(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floor']?['first'];
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
    return text;
  }

  Future<String> getSecondFloor(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final secondFloor = data?['floor']?['second'];
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

  Future<String> getClassrooms(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floor']?['first'];
    final secondFloor = data?['floor']?['second'];
    final classrooms = firstFloor['classrooms'] + secondFloor['classrooms'];
    text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
    return text;
  }

  Future<String> getLabs(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final secondFloor = data?['floor']?['second'];
    final labs = secondFloor['labs'];
    text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
    return text;
  }

  Future<String> getDean(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final dean = data?['dean'];
    if (dean != null) {
      text += 'Dean: $dean\n';
    }
    return text;
  }

  Future<String> getHistory(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final history = data?['history'];

    if (history != null) {
      text += 'History: $history\n';
    }
    return text;
  }

  Future<String> getDept(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final department = data?['department'];

    if (department != null) {
      text += 'Department: $department\n';
    }
    return text;
  }

  Future<String> getFacility(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floor']?['first'] ?? [];
    final secondFloor = data?['floor']?['second'] ?? [];
    final facilities = firstFloor['facilities'] + secondFloor['facilities'];
    text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    return text;
  }

  Future<String> getData(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
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

  Future<String> getFacultyOffice(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floor']?['first'] ?? [];
    final secondFloor = data?['floor']?['second'] ?? [];
    final facultyOffices =
        '\nFirst Floor: ${firstFloor['facultyOffices']}\nSecond Floor: ${secondFloor['facultyOffices']}\n';
    text += 'Faculty Offices: ${facultyOffices ?? 'N/A'}\n';
    return text;
  }

  Future<String> fetchData() async {
    // simulate fetching data from an API
    await Future.delayed(Duration(seconds: 2));
    return "This is some data that we fetched from an API.";
  }

  Future<String> searchForString(String query) async {
    String text = '';
    String data = await getDean('seecsUg');
    if (data.contains(query)) {
      text = "This is not a location but $query is a Dean at SEECS UG.";
      return text;
    } else {
      String data = await getDept('Department');
      if (data.contains(query)) {
        text = "$query is a Department at SEECS UG .";
        return text;
      } else {
        String data = await getFirstFloors('seecsUg');
        if (data.contains(query)) {
          text = "You can find $query on First Floor & ";
          String data = await getClassrooms('seecsUg');
          if (data.contains(query)) {
            text = text + " Specifically it is a Classroom in SEECS UG ";
          } else {
            String data = await getLabs('seecsUg');
            if (data.contains(query)) {
              text = text + "Specifically it is a Lab in SEECS UG ";
            } else {
              String data = await getFacility('seecsUg');
              if (data.contains(query)) {
                text = text +
                    "Specifically it is a Fcailitiy you can get in SEECS UG ";
              } else {
                String data = await getFacultyOffice('seecsUg');
                if (data.contains(query)) {
                  text =
                      text + "Specifically it is a Faculty Office in SEECS UG ";
                }
              }
            }
          }
          return text;
        } else {
          String data = await getSecondFloor('seecsUg');
          if (data.contains(query)) {
            text = "You can find $query on Second Floor & ";
            String data = await getClassrooms('seecsUg');
            if (data.contains(query)) {
              text = text + "Specifically it is a Classroom in SEECS UG";
            } else {
              String data = await getLabs('seecsUg');
              if (data.contains(query)) {
                text = text + "Specifically it is a Lab in SEECS UG";
              } else {
                String data = await getFacility('seecsUg');
                if (data.contains(query)) {
                  text = text +
                      "Specifically it is a Fcailitiy you can get in SEECS UG ";
                } else {
                  String data = await getFacultyOffice('seecsUg');
                  if (data.contains(query)) {
                    text = text +
                        "Specifically it is a Faculty Office in SEECS UG";
                  }
                }
              }
            }
            return text;
          }
        }
      }
    }
    text = "$query Not Found in SEECS UG Block.";
    return text;
  }
}
