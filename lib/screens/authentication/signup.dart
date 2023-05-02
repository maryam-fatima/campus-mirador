// imported the required libraries
import 'package:flutter/material.dart';
import '../../widgets/alert_class.dart';
import '../home.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

// This screen serves the purpose of signing up the user.
// It provides the user with two options
// 1. Either signup via email/username and make him a registered user to our application
// 2. Or Login as a visitor via gmail - it will be one time only

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // temp variables that will used throughout this screen
  Color updateColor = Colors.grey;
  bool _obscureText = false;
  String _email = "";
  String _password = "";
  String _status = "";

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
                height: height * 0.02,
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
                  'SignUp Screen',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: width * 0.05,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
                    fontWeight: FontWeight.w500, fontSize: width * 0.03),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                        size: 20,
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
                    fontWeight: FontWeight.w500, fontSize: width * 0.03),
                obscureText: true,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Status is required!';
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
                    labelText: ' Status ',
                    hintText: 'Enter Your Status',
                    icon: const Icon(Icons.privacy_tip)),
                onChanged: (value) {
                  setState(() {
                    _status = value;
                  });
                },
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: width * 0.03),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        updateColor = Colors.teal.shade900;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      'Already have an account ? Log In',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: updateColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  width: width * 0.4,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.teal.shade500,
                      borderRadius: BorderRadius.circular(28)),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  padding: const EdgeInsets.all(2),
                  child: TextButton(
                    //yeh sign up wala press hai
                    onPressed: () async {
                      if (_email.isEmpty ||
                          _password.isEmpty ||
                          _status.isEmpty) {
                        print('EMPTY');
                        showAlertDialog(context);
                      } else if (!RegExp(
                              r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
                              caseSensitive: false)
                          .hasMatch(_email)) {
                        showAlertDialog2(context);
                      } else {
                        await FirebaseServices()
                            .signUpWithEmailAndPassword(_email, _password);
                        showAlertDialog3(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                    },
                    child: Text(
                      '  SIGN UP   ',
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
                          "SIGNUP AS VISITOR",
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
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
