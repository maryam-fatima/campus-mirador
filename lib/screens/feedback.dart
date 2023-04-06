import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackScreen extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
        backgroundColor: Colors.teal.shade900,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
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
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
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
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .teal.shade900, // set the background color to blue
                    ),
                    onPressed: () {
                      handleSubmit();
                      print(feedbackMap);
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        // TODO: Save feedback to Firestore or another backend
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Feedback submitted successfully')),
                        );
                      }
                    },
                    child: Text('Submit Feedback'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 3,
                ),
                Text(
                  "Client's Feedback",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.teal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                getFeedback(
                  username: feedbackMap.keys.elementAt(1),
                  feedback: feedbackMap.values.elementAt(1),
                ),
                SizedBox(
                  height: 10,
                ),
                getFeedback(
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

class getFeedback extends StatelessWidget {
  const getFeedback({required this.username, required this.feedback});
  final String username;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.teal.shade400,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CircleAvatar(
                    backgroundColor: Colors.teal.shade900,
                    radius: 20,
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 20,
                    )),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Username :   $username',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Response : $feedback',
                      maxLines: 3,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                          size: 20,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                          size: 20,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.yellowAccent,
                          size: 20,
                        )
                      ],
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
