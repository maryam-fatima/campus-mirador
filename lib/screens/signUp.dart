import 'package:flutter/material.dart';
import 'ScanBuilding.dart';
import 'home.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'login.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color update_color = Colors.grey;

  String _email = "";
  String _password = "";
  String _status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0E6E9),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(7, 50, 12, 30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFE0E6E9)),
          child: Wrap(
            spacing: 6,
            children: [
              Image(image: AssetImage('images/heading.png')),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.teal.shade900,
                //color of divider
                height: 5,
                //height spacing of divider
                thickness: 3,
                //thickness of divier line
                indent: 25,
                //spacing at the start of divider
                endIndent: 25, //spacing at the end of divider
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 20, 0, 20),
                child: Text(
                  'SignUp Screen',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.grey.shade500)),
                    labelText: ' Username ',
                    hintText: 'Enter Your email',
                    icon: Icon(Icons.person_2_rounded)),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.grey.shade500)),
                    labelText: ' Password',
                    hintText: 'Enter Your Password',
                    icon: Icon(Icons.lock)),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.grey.shade500)),
                    labelText: ' Status ',
                    hintText: 'Enter Your Status',
                    icon: Icon(Icons.privacy_tip)),
                onChanged: (value) {
                  setState(() {
                    _status = value;
                  });
                },
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color = Colors.teal.shade900;
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
                          fontSize: 12,
                          color: update_color,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.teal.shade500,
                      borderRadius: BorderRadius.circular(28)),
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(2),
                  child: TextButton(
                    //yeh sign up wala press hai
                    onPressed: () async {
                      await FirebaseServices()
                          .signUpWithEmailAndPassword(_email, _password);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      '  SIGN UP   ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    color: Colors.grey.shade900,
                  )),
                  Text(
                    ' Or Connect with  ',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2.5,
                    color: Colors.grey.shade900,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(3),
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
                              builder: (context) => HomeScreen()));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage('images/google_icon.png'),
                            width: 30,
                            height: 30,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "SIGNUP WITH VISITOR",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 2),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
