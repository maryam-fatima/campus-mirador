// imported the required libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/get_feedback.dart';

// This screen is made with a purpose to get the feedback from our Users , if they encounter any issue or bug
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _feedback;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  Map<String, String> feedbackMap = {
    'JohnDoe': 'Great job on the app!',
    'Urooj Raza': 'Very Helpful',
    'Zainab Ghauri': ' user-friendly App',
  };

  void appendFeedback(String username, String newFeedback) {
    feedbackMap[username] = feedbackMap.containsKey(username)
        ? '${feedbackMap[username]}\n$newFeedback'
        : newFeedback;
  }

  void handleSubmit() {
    final String username = usernameController.text;
    final String feedback = feedbackController.text;
    appendFeedback(username, feedback);
    // do something with username and password...
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double imageHeight = screenSize.height * 0.35;
    final double buttonHeight = screenSize.height * 0.1;
    final double avatarRadius = screenSize.width * 0.2;
    final double buttonFontSize = screenSize.width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Form'),
        backgroundColor: Colors.teal.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.teal.shade100,
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: 'Enter your Username',
                        focusColor: Colors.teal.shade900),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _feedback = value;
                    },
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.teal.shade100,
                  child: TextFormField(
                    controller: feedbackController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: 'Enter Feedback',
                        focusColor: Colors.teal.shade900),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter the feedback';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _feedback = value;
                    },
                  ),
                ),
                SizedBox(height: screenSize.height * 0.03),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal.shade900,
                      minimumSize:
                          Size(screenSize.width * 0.4, buttonHeight * 0.7),
                      // set the background color to blue
                    ),
                    onPressed: () {
                      handleSubmit();
                      print(feedbackMap);
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        // TODO: Save feedback to Firestore or another backend
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Feedback submitted successfully')),
                        );
                      }
                    },
                    child: const Text('Submit Feedback'),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                const Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: screenSize.height * 0.03,
                ),
                Text(
                  "Client's Feedback",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: screenSize.width * 0.054,
                      color: Colors.teal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GetFeedback(
                  username: feedbackMap.keys.elementAt(1),
                  feedback: feedbackMap.values.elementAt(1),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                GetFeedback(
                  username: feedbackMap.keys.elementAt(2),
                  feedback: feedbackMap.values.elementAt(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
