// imported the required libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/container_menu.dart';
import 'welcome.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ar_screens/scan_building.dart';
import 'features/view_stats.dart';
import 'features/chat_screen.dart';
import 'features/feedback.dart';

// This screen is Main screen that list all the facilities one can get in
// our Application that are :
// 1. Scan the Building
// 2. See the Stats
// 3. Feedback Screen
// 4. Help Screen - integrated with ChatGPT
// 5. Log out , end the session and move to Welcome Screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final double height = screen.height;
    final double width = screen.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: const Text("Mirador"),
      ),
      body: Scaffold(
        backgroundColor: Colors.teal.shade50,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.025, screen.height * 0.05, 0, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hi , User',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: screen.width * 0.04,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(
                    height: screen.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Virtually visit NUST',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: screen.width * 0.048,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'campus with Mirador',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: screen.width * 0.048,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: screen.height * 0.02,
                  ),
                  TextButton(
                    onPressed: () async {
                      await FirebaseServices().googleSignOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScanBuilding()));
                    },
                    child: ContainerMenu(
                      imagePath: "images/scan.png",
                      labelText: " Scan the Building",
                      labelTextDescription: " SEECS , IAEC",
                      videoText: " Watch in AR",
                    ),
                  ),
                  SizedBox(
                    height: screen.height * 0.02,
                  ),
                  TextButton(
                    onPressed: () async {
                      await FirebaseServices().googleSignOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewStats()));
                    },
                    child: ContainerMenu(
                      imagePath: "images/stats.png",
                      labelText: " See the Mirador\'s Stats",
                      labelTextDescription: " SEECS , IAEC",
                      videoText: " Detailed View",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screen.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .teal.shade900, // set the background color to blue
                  ),
                  child: const Text("Logout"),
                  onPressed: () async {
                    await FirebaseServices().googleSignOut();
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackScreen()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: width * 0.1,
                    child: Image(
                      image: const AssetImage('images/feed.png'),
                      width: width * 0.4,
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
                    backgroundColor: Colors.white,
                    radius: width * 0.1,
                    child: Image(
                      image: const AssetImage('images/bot.png'),
                      width: width * 0.4,
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
