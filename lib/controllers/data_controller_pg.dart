import 'package:cloud_firestore/cloud_firestore.dart';

class DataControllerPG {
  Future<String> getFloors(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floors']?['first'];
    final secondFloor = data?['floors']?['second'];
    final basement = data?['floors']?['Basement'];
    final groundFloor = data?['floors']?['ground'];

    if (basement != null) {
      // Extract data from firstFloor and format it
      final classrooms = basement['classrooms'];
      final Office = firstFloor['labs'];
      final facilities = firstFloor['facilities'];
      text += '\n Basement Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    } else if (groundFloor != null) {
      // Extract data from firstFloor and format it
      final Office = groundFloor['Offices'];
      final labs = groundFloor['labs'];
      final facilities = groundFloor['Facilities'];
      text += '\n Second Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    } else if (firstFloor != null) {
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
    } else if (secondFloor != null) {
      // Extract data from firstFloor and format it
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      text += '\n Second Floor:\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
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

  Future<String> getBasementFloors(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final firstFloor = data?['floors']?['first'];
    final basement = data?['floors']?['Basement'];
    final groundFloor = data?['floors']?['ground'];

    if (basement != null) {
      // Extract data from firstFloor and format it
      final classrooms = basement['classrooms'];
      final Office = basement['labs'];
      final facilities = basement['facilities'];
      text += '\n Basement Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
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
      // Extract data from firstFloor and format it
      final Office = groundFloor['Offices'];
      final labs = groundFloor['labs'];
      final facilities = groundFloor['Facilities'];
      text += '\n Ground Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
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
      // Extract data from firstFloor and format it
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      text += '\n Second Floor:\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
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
    final classrooms = firstFloor['classrooms'];
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
    final firstFloor = data?['floors']?['first'];
    final groundFloor = data?['floors']?['ground'];
    final secondFloor = data?['floors']?['second'];
    final labs = firstFloor['labs'] + groundFloor['labs'] + secondFloor['labs'];
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
    final BasementFloor = data?['floors']?['Basement'] ?? [];
    final groundFloor = data?['floors']?['ground'] ?? [];
    final firstFloor = data?['floors']?['first'] ?? [];
    final secondFloor = data?['floors']?['second'] ?? [];
    final facilities = firstFloor['facilities'] +
        secondFloor['facilities'] +
        groundFloor['Facilities'] +
        BasementFloor['facilities'];
    text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    return text;
  }

  Future<String> getData(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    final basementFloor = data?['floors']?['Basement'];
    final groundFloor = data?['floors']?['ground'];
    final firstFloor = data?['floors']?['first'];
    final secondFloor = data?['floors']?['second'];
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

    if (basementFloor != null) {
      // Extract data from firstFloor and format it
      final classrooms = basementFloor['classrooms'];
      final Office = basementFloor['labs'];
      final facilities = basementFloor['facilities'];
      text += '\n Basement Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Classrooms: ${classrooms?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
    }

    if (groundFloor != null) {
      // Extract data from firstFloor and format it
      final Office = groundFloor['Offices'];
      final labs = groundFloor['labs'];
      final facilities = groundFloor['Facilities'];
      text += '\n Second Floor:\n';
      text += 'Offices: ${Office?.toString() ?? 'N/A'}\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
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
      // Extract data from firstFloor and format it
      final labs = secondFloor['labs'];
      final facilities = secondFloor['facilities'];
      text += '\n Second Floor:\n';
      text += 'Labs: ${labs?.toString() ?? 'N/A'}\n';
      text += 'Facilities: ${facilities?.toString() ?? 'N/A'}\n';
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
    final firstFloor = data?['floors']?['first'] ?? [];
    final facultyOffices = '\nFirst Floor: ${firstFloor['facultyOffices']}\n';
    text += 'Faculty Offices: ${facultyOffices ?? 'N/A'}\n';
    return text;
  }

  Future<String> getOffice(String documentName) async {
    final document = await FirebaseFirestore.instance
        .collection('buildings')
        .doc(documentName)
        .get();
    final data = document.data();
    String text = '';
    final groundFloor = data?['floors']?['ground'] ?? [];
    final facultyOffices = '\n Ground Floor: ${groundFloor['Offices']}\n';
    text += 'Offices: ${facultyOffices ?? 'N/A'}\n';
    return text;
  }

  Future<String> fetchData() async {
    // simulate fetching data from an API
    await Future.delayed(Duration(seconds: 2));
    return "This is some data that we fetched from an API.";
  }

  Future<String> searchForString(String query) async {
    String text = '';

    String data = await getBasementFloors('seecsPg');
    if (data.contains(query)) {
      text = "$query is in Basement at SEECS PG & ";
      String data = await getFacility('seecsPg');
      if (data.contains(query)) {
        text = text + "$query is a Facility at SEECS PG .";
      }
      return text;
    } else {
      String data = await getGroundFloor('seecsPg');
      if (data.contains(query)) {
        text = "$query is on Ground Floor at SEECS PG & ";
        String data = await getOffice('seecsPg');
        if (data.contains(query)) {
          text = text + "$query is an Office at SEECS PG .";
        } else {
          String data = await getLabs('seecsPg');
          if (data.contains(query)) {
            text = text + "$query is a Lab at SEECS PG .";
          } else {
            String data = await getFacility('seecsPg');
            if (data.contains(query)) {
              text = text + "$query is a Facility at SEECS PG .";
            }
          }
          return text;
        }
      } else {
        String data = await getFirstFloors('seecsPg');
        if (data.contains(query)) {
          text = "$query is on First Floor at SEECS PG & ";
          String data = await getClassrooms('seecsPg');
          if (data.contains(query)) {
            text = text + "$query is a Classroom at SEECS PG .";
          } else {
            String data = await getLabs('seecsPg');
            if (data.contains(query)) {
              text = text + "$query is a Lab at SEECS PG .";
            } else {
              String data = await getFacility('seecsPg');
              if (data.contains(query)) {
                text = text + "$query is a Facility at SEECS PG .";
              } else {
                String data = await getFacultyOffice('seecsPg');
                if (data.contains(query)) {
                  text = text + "$query is a Faculty Office at SEECS PG .";
                }
              }
            }
            return text;
          }
        } else {
          String data = await getSecondFloor('seecsPg');
          if (data.contains(query)) {
            text = "$query is on second Floor at SEECS PG & ";
            String data = await getLabs('seecsPg');
            if (data.contains(query)) {
              text = text + "$query is a Lab at SEECS PG .";
            } else {
              String data = await getFacility('seecsPg');
              if (data.contains(query)) {
                text = text + "$query is a Facility at SEECS PG .";
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
}
