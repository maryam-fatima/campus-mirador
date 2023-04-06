import 'package:flutter/material.dart';
import 'home.dart';
import 'package:chatbot/services/firebase_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HelpPage.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = false;
  Color update_color = Colors.grey;
  Color update_color_forgot_password = Colors.grey;
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(12, 50, 12, 40),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFE0E6E9)),
          child: Wrap(
            spacing: 10,
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
                  'Login Screen',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.grey.shade500)),
                    labelText: ' Email ',
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
                height: 12,
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
                      weight: 10,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        update_color = Colors.teal.shade900;
                      });
                    },
                    child: Text(
                      'Remember',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: update_color,
                            fontWeight: FontWeight.w600,
                            fontSize: 11),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
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
                            fontSize: 11),
                      ),
                    ),
                  ),
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
                    //yeh login wala hai
                    onPressed: () async {
                      await FirebaseServices()
                          .signInWithEmailAndPassword(_email, _password);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      '   LOG IN   ',
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
                          width: 10,
                        ),
                        Text(
                          "LOGIN AS VISITOR",
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
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(220, 0, 0, 0),
                    child: TextButton(
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
