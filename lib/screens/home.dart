import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Welcome.dart';
import 'login.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'HelpPage.dart';
import 'ScanBuilding.dart';
import 'viewStats.dart';
import 'HelpPage.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text("Mirador"),
      ),
      body: Scaffold(
        backgroundColor: Colors.teal.shade50,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hi , Urooj',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Virtually visit NUST',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 19,
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
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      await FirebaseServices().googleSignOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScanBuilding()));
                    },
                    child: Container_Menu(
                      image_path: "images/scan.png",
                      label_text: " Scan the Building",
                      label_text_description: " SEECS , IAEC",
                      video_text: " Watch in AR",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () async {
                      await FirebaseServices().googleSignOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => viewStats()));
                    },
                    child: Container_Menu(
                      image_path: "images/stats.png",
                      label_text: " See the Mirador\'s Stats",
                      label_text_description: " SEECS , IAEC",
                      video_text: " Detailed View",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Logout"),
                  onPressed: () async {
                    await FirebaseServices().googleSignOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
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
                    backgroundColor: Colors.black54,
                    radius: 30,
                    child: Image(
                      image: AssetImage('images/bot.png'),
                      width: 99,
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
                    backgroundColor: Colors.black54,
                    radius: 30,
                    child: Image(
                      image: AssetImage('images/bot.png'),
                      width: 99,
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

class Container_Menu extends StatelessWidget {
  Container_Menu(
      {required this.image_path,
      required this.label_text,
      required this.label_text_description,
      required this.video_text});
  final String image_path;
  final String label_text;
  final String label_text_description;
  final String video_text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal,
      ),
      width: 320,
      height: 180,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image(
            image: AssetImage(image_path),
            width: 75,
            height: 75,
          ),
          SizedBox(
            width: 25,
          ),
          Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '  ${label_text}  ',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600,
                            fontSize: 12)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '   ${label_text_description}  ',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 10)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.video,
                        color: Colors.white,
                        size: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' ${video_text}',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 8)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
