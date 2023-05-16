import 'package:cloud_firestore/cloud_firestore.dart';

class DataControllerIAEC {
  Future<String> getData(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    final groundFloor = data?['floors']?['ground'];
    final firstFloor = data?['floors']?['first'];
    final secondFloor = data?['floors']?['second'];
    final dean = data?['dean'];

    String text = '';

    if (dean != null) {
      text += 'Dean: $dean\n';
    }

    if (groundFloor != null) {
      // Extract data from firstFloor and format it
      final Office = groundFloor['offices'];
      final labs = groundFloor['labs'];
      final facilities = groundFloor['facilities'];
      final classrooms = groundFloor['classrooms'];
      text += '\n Second Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    }

    if (firstFloor != null) {
      // Extract data from firstFloor and format it
      final classrooms = firstFloor['classrooms'];
      final facilities = firstFloor['facilities'];
      final facultyOffices = firstFloor['facultyOffices'];
      text += '\nFirst Floor:\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
    }

    if (secondFloor != null) {
      // Extract data from firstFloor and format it
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      final facultyOffices = secondFloor['facultyOffices'];
      text += '\n Second Floor:\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    }

    return text;
  }

  Future<String> getFloors(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floors']?['first'];
    final secondFloor = data?['floors']?['second'];
    final groundFloor = data?['floors']?['ground'];
    if (groundFloor != null) {
      // Extract data from Ground Floor and format it
      final Office = groundFloor['offices'];
      final labs = groundFloor['labs'];
      final classrooms = groundFloor['classrooms'];
      final facilities = groundFloor['facilities'];
      text += '\n Second Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    } else if (firstFloor != null) {
      // Extract data from First Floor and format it
      final classrooms = firstFloor['classrooms'];
      final facilities = firstFloor['facilities'];
      final facultyOffices = firstFloor['facultyOffices'];
      text += '\nFirst Floor:\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
    } else if (secondFloor != null) {
      // Extract data from Second Floor and format it
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      final facultyOffices = secondFloor['facultyOffices'];
      text += '\n Second Floor:\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    }
    return text;
  }

  Future<String> getFirstFloors(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floors']?['first'];
    if (firstFloor != null) {
      // Extract data from firstFloor and format it
      final classrooms = firstFloor['classrooms'];
      final facilities = firstFloor['facilities'];
      final facultyOffices = firstFloor['facultyOffices'];
      text += '\nFirst Floor:\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
    }
    return text;
  }

  Future<String> getGroundFloor(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final groundFloor = data?['floors']?['ground'];
    if (groundFloor != null) {
      // Extract data from Ground Floor and format it
      final Office = groundFloor['offices'];
      final labs = groundFloor['labs'];
      final classrooms = groundFloor['classrooms'];
      final facilities = groundFloor['facilities'];
      text += '\n Second Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
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
    final secondFloor = data?['floors']?['second'];
    if (secondFloor != null) {
      // Extract data from Second Floor and format it
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      final facultyOffices = secondFloor['facultyOffices'];
      text += '\n Second Floor:\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
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
    final firstFloor = data?['floors']?['first'];
    final groundFloor = data?['floors']?['ground'];
    final classrooms = firstFloor['classrooms'] + groundFloor['classrooms'];
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
    final groundFloor = data?['floors']?['ground'];
    final secondFloor = data?['floors']?['second'];
    final labs =
        groundFloor['labs'].toString() + secondFloor['labs'].toString();
    text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
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
    } else {
      text += 'History: a short history\n';
    }
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

  Future<String> getFacility(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final groundFloor = data?['floors']?['ground'] ?? [];
    final firstFloor = data?['floors']?['first'] ?? [];
    final secondFloor = data?['floors']?['second'] ?? [];
    final facilities = firstFloor['facilities'].toString() +
        secondFloor['facilities'].toString() +
        groundFloor['Facilities'].toString();
    text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    return text;
  }

  Future<String> getFacultyOffices(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floors']?['first'] ?? [];
    final secondFloor = data?['floors']?['second'];

    final facultyOffices = firstFloor['facultyOffices'].toString() +
        secondFloor['facultyOffices'].toString();

    text += 'Faculty Offices: ${facultyOffices?.toString() ?? 'N/A'}\n';
    return text;
  }

  Future<String> fetchData() async {
    // simulate fetching data from an API
    await Future.delayed(Duration(seconds: 2));
    return "This is some data that we fetched from an API.";
  }

  Future<String> searchForString(String query) async {
    String text = '';

    String data = await getFirstFloors('IAEC');
    if (data.contains(query)) {
      text = "$query is on First Floor at IAEC & ";
      print('HERE');
      String data = await getClassrooms('IAEC');
      if (data.contains(query)) {
        text = text + "$query is a Classroom at IAEC";
        return text;
      } else {
        String data = await getFacility('IAEC');
        if (data.contains(query)) {
          text = text + "$query is a Facility at IAEC";
          return text;
        } else {
          String data = await getFacultyOffices('IAEC');
          if (data.contains(query)) {
            text = text + "$query is a Faculty Office at IAEC";
            return text;
          }
        }
        return text;
      }
    } else {
      String data = await getGroundFloor('IAEC');
      if (data.contains(query)) {
        text = "$query is on Ground Floor at IAEC & ";
        String data = await getFacultyOffices('IAEC');
        if (data.contains(query)) {
          text = text + "$query is a Faculty Office at IAEC";
          return text;
        } else {
          String data = await getLabs('IAEC');
          if (data.contains(query)) {
            text = text + "$query is a Lab at IAEC";
            return text;
          } else {
            String data = await getFacility('IAEC');
            if (data.contains(query)) {
              text = text + "$query is a Facility at IAEC";
              return text;
            } else {
              String data = await getClassrooms('IAEC');
              if (data.contains(query)) {
                text = text + "$query is a Classroom at IAEC";
                return text;
              }
            }
          }
          return text;
        }
      } else {
        String data = await getSecondFloor('IAEC');
        if (data.contains(query)) {
          text = "$query is on second Floor at IAEC & ";
          String data = await getLabs('IAEC');
          if (data.contains(query)) {
            text = text + "$query is a Lab at IAEC";
            return text;
          } else {
            String data = await getFacility('IAEC');
            if (data.contains(query)) {
              text = text + "$query is a Facility at IAEC";
              return text;
            } else {
              String data = await getFacultyOffices('IAEC');
              if (data.contains(query)) {
                text = text + "$query is a Faculty Office at IAEC";
                return text;
              }
              return text;
            }
            return text;
          }
        }
      }
    }
    text = "$query Not Found in IAEC .";
    return text;
  }
}
