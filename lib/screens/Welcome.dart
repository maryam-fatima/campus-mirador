// imported the required libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Authentication/signUp.dart';

// This is a Welcome Page that serves as the start screen to our Application -
// Campus Mirador

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004D40),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/building.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.fromLTRB(7, 50, 0, 0),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Image(
                          image: AssetImage('images/icon.png'),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      VerticalDivider(
                        thickness: 2,
                        width: 25,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CAMPUS',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            ),
                          ),
                          Text(
                            'MIRADOR',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade500,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(top: 420),
                padding: EdgeInsets.all(9),
                child: TextButton(
                  onPressed: () {
                    // Navigation to Signup Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 17,
                        letterSpacing: 2),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
