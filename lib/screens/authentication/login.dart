// imported the required libraries
import 'package:flutter/material.dart';
import '../../widgets/alert_class.dart';
import '../home.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../features/help_page.dart';
import '../features/chat_screen.dart';

// This screen serves the purpose of Logging In the user.
// It provides the user with two options
// 1. Either Login via email/username , it will check whether he/she is a registered user in firebase
// 2. Or Login as a visitor via gmail - it will be one time only

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // temp variables that will used throughout this screen
  bool _obscureText = false;
  Color update_color = Colors.grey;
  Color update_color_forgot_password = Colors.grey;
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height;
    final double width = screenSize.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE0E6E9),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              width * 0.02, height * 0.05, width * 0.02, height * 0.03),
          padding: EdgeInsets.all(width * 0.05),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.05),
              color: const Color(0xFFE0E6E9)),
          child: Wrap(
            spacing: width * 0.01,
            children: [
              const Image(image: AssetImage('images/heading.png')),
              SizedBox(
                height: height * 0.01,
              ),
              Divider(
                color: Colors.teal.shade900,
                //color of divider
                height: height * 0.005,
                thickness: height * 0.003,
                indent: width * 0.06,
                endIndent: width * 0.06,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.26, height * 0.02, 0, height * 0.02),
                child: Text(
                  'Login Screen',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              TextFormField(
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'Email is required!';
                  }
                  if (!RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
                          caseSensitive: false)
                      .hasMatch(textValue)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.06),
                        borderSide: BorderSide(
                            width: width * 0.005, color: Colors.grey.shade500)),
                    labelText: ' Email ',
                    hintText: 'Enter Your email',
                    icon: const Icon(Icons.person_2_rounded)),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: width * 0.037),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                validator: (textValue) {
                  if (textValue == null || textValue.isEmpty) {
                    return 'Password is required!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.06),
                        borderSide: BorderSide(
                            width: width * 0.005, color: Colors.grey.shade500)),
                    labelText: ' Password',
                    hintText: 'Enter Your Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: width * 0.05,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    icon: const Icon(Icons.lock)),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: width * 0.037),
                obscureText: true,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color = Colors.teal.shade900;
                      });
                    },
                    child: Icon(
                      Icons.check_box,
                      color: update_color,
                      weight: width * 0.02,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color = Colors.teal.shade900;
                      });
                    },
                    child: Text(
                      'Remember Me?',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: update_color,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.03),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color_forgot_password = Colors.teal.shade900;
                      });
                    },
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: update_color_forgot_password,
                            fontWeight: FontWeight.w600,
                            fontSize: width * 0.03),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: width * 0.37,
                  height: height * 0.074,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.teal.shade500,
                      borderRadius: BorderRadius.circular(28)),
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.all(2),
                  child: TextButton(
                    //yeh login wala hai
                    onPressed: () async {
                      if (_email.isEmpty || _password.isEmpty) {
                        print('EMPTY');
                        showAlertDialog(context);
                      } else if (!RegExp(
                              r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
                              caseSensitive: false)
                          .hasMatch(_email)) {
                        showAlertDialog2(context);
                      }
                      await FirebaseServices()
                          .signInWithEmailAndPassword(_email, _password);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: Text(
                      '   LOG IN   ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    color: Colors.grey.shade900,
                  )),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Text(
                    'Or Connect with',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    color: Colors.grey.shade900,
                  )),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                padding: EdgeInsets.all(width * 0.01),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade500,
                    borderRadius: BorderRadius.circular(28)),
                child: TextButton(
                    onPressed: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image(
                            image: const AssetImage('images/google_icon.png'),
                            width: width * 0.4,
                            height: height * 0.4,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.07,
                        ),
                        Text(
                          "LOGIN AS VISITOR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.042,
                              letterSpacing: 2),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: height * 0.016,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(width * 0.59, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.teal.shade300,
                        radius: width * 0.1,
                        child: Image(
                          image: const AssetImage('images/bot.png'),
                          width: width * 0.5,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
