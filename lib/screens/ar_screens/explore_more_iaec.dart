import 'package:chatbot/controllers/data_controller_pg.dart';
import 'package:chatbot/screens/ar_screens/explore_more_ug.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/data_controller_iaec.dart';
import '../features/chat_screen.dart';
import '../features/feedback.dart';
import 'package:chatbot/screens/welcome.dart';
import 'package:chatbot/services/firebase_services.dart';

// This screen is responsible for showing the detailed information about the buildings
// The data is saved in the firebase and we are fetching data using the Model class

DataControllerIAEC _dataController =
    DataControllerIAEC(); // Create an instance of DataController

class ExploreMoreIAEC extends StatefulWidget {
  const ExploreMoreIAEC({Key? key}) : super(key: key);

  @override
  State<ExploreMoreIAEC> createState() => _ExploreMoreIAECState();
}

class _ExploreMoreIAECState extends State<ExploreMoreIAEC> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageHeight = screenSize.height * 0.35;
    final double buttonHeight = screenSize.height * 0.1;
    final double avatarRadius = screenSize.width * 0.2;
    final double buttonFontSize = screenSize.width * 0.05;
    final TextEditingController _controller = TextEditingController();
    final prediction = 'IAEC';
    String _searchTerm = '';

    void _handleSearch(String value) {
      setState(() {
        _searchTerm = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: const Text('Mirador'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextButton(
                      onPressed: () {
                        showAlertDialog(context,
                            value: _dataController.getData(prediction));
                      },
                      child: Text(
                        'IAEC Building',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                color: Colors.teal.shade600)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      color: Colors.teal.shade50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Search a location i.e IT office',
                          hintStyle: TextStyle(
                              color: Colors.teal.shade900,
                              fontWeight: FontWeight.w500),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              showSearchData(context,
                                  value: _dataController
                                      .searchForString(_controller.text));
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value:
                                      _dataController.getHistory(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  'History',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value: _dataController
                                      .getGroundFloor(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Ground Floor',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.032,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value: _dataController.getDean(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  'Dean',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value: _dataController
                                      .getFirstFloors(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  '1st Floor',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value: _dataController
                                      .getSecondFloor(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '5',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  '2nd Floor',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.034,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showAlertDialog(context,
                                value: _dataController.getLabs(prediction));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            color: Colors.teal.shade900,
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '6',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  'Labs',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value: _dataController
                                      .getClassrooms(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '7',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  'CRs',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          color: Colors.teal.shade900,
                          width: MediaQuery.of(context).size.width * 0.26,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () {
                              showAlertDialog(context,
                                  value:
                                      _dataController.getFacility(prediction));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '8',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  'Facility',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showAlertDialog(context,
                                value: _dataController
                                    .getFacultyOffices(prediction));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            color: Colors.teal.shade900,
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.width * 0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '9',
                                  style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 27,
                                          color: Colors.white)),
                                ),
                                Text(
                                  'Fac Office',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.teal.shade50)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal.shade900,
                    minimumSize: Size(screenSize.width * 0.3,
                        buttonHeight * 0.5), // set the background color to blue
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: buttonFontSize * 0.8),
                  ),
                  onPressed: () async {
                    await FirebaseServices().googleSignOut();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackScreen()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.teal.shade100,
                    radius: avatarRadius * 0.5,
                    child: Image(
                      image: const AssetImage('images/feed.png'),
                      width: avatarRadius * 1,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.teal.shade100,
                    radius: avatarRadius * 0.5,
                    child: Image(
                      image: const AssetImage('images/bot.png'),
                      width: avatarRadius * 1.4,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyAlert extends StatelessWidget {
  const MyAlert({super.key});
  final prediction = 'seecsPg';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () {
          showAlertDialog(context, value: _dataController.getData(prediction));
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context, {required Future<String> value}) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Explore More Data"),
    content: FutureBuilder<String>(
      future: value,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: snapshot.data!,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          );
        } else {
          return const Text('No data found');
        }
      },
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showSearchData(BuildContext context, {required Future<String> value}) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Search Info",
      style: TextStyle(
          fontSize: 25,
          color: Colors.teal.shade900,
          fontWeight: FontWeight.w800),
    ),
    content: FutureBuilder<String>(
      future: value,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: snapshot.data!,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.teal.shade900,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          );
        } else {
          return const Text('No data found');
        }
      },
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
