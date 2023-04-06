import 'package:chatbot/screens/exploreMore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_screen.dart';
import 'feedback.dart';
import 'package:chatbot/services/firebase_services.dart';
import '../controllers/dataController.dart';
import 'package:chatbot/screens/Welcome.dart';

class AROverlay extends StatefulWidget {
  const AROverlay({Key? key}) : super(key: key);

  @override
  State<AROverlay> createState() => _AROverlayState();
}

class _AROverlayState extends State<AROverlay> {
  DataController _dataController =
      DataController(); // Create an instance of DataController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text('Mirador'),
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage('images/AROverlay.jpg'),
            width: 400,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal.shade900, // set the background color to blue
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ExploreMore()));
            },
            child: Text('Explore More'),
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
                    MaterialPageRoute(builder: (context) => FeedbackScreen()),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Image(
                    image: AssetImage('images/feed.png'),
                    width: 99,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
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
    );
  }
}
