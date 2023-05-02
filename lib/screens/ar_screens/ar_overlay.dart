// imported the required libraries
import 'package:chatbot/screens/ar_screens/explore_more.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/screens/features/chat_screen.dart';
import 'package:chatbot/screens/features/feedback.dart';
import 'package:chatbot/screens/welcome.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'package:chatbot/controllers/data_controller.dart';

// This screen is responsible for displaying the AR Overlay of the building
// that our user will be scanning at a real time

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
    final Size screenSize = MediaQuery.of(context).size;
    final double imageHeight = screenSize.height * 0.35;
    final double buttonHeight = screenSize.height * 0.1;
    final double avatarRadius = screenSize.width * 0.2;
    final double buttonFontSize = screenSize.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: const Text('Mirador'),
      ),
      body: Column(
        children: [
          Image(
            image: const AssetImage('images/AROverlay.jpg'),
            height: imageHeight,
            width: screenSize.width * 0.7,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal.shade900,
              minimumSize: Size(screenSize.width * 0.4,
                  buttonHeight * 0.7), // set the background color to blue
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ExploreMore()));
            },
            child: Text(
              'Explore More',
              style: TextStyle(fontSize: buttonFontSize),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.2,
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
                  radius: avatarRadius * 0.6,
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
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.teal.shade100,
                  radius: avatarRadius * 0.6,
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
    );
  }
}
