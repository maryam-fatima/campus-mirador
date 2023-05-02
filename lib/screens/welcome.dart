// imported the required libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication/signup.dart';

// This is a Welcome Page that serves as the start screen to our Application -
// Campus Mirador

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF004D40),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/building.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.05,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Image(
                          image: AssetImage('images/icon.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const VerticalDivider(
                        thickness: 2,
                        width: 25,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'CAMPUS',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: screenWidth * 0.063,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            ),
                          ),
                          Text(
                            'MIRADOR',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: screenWidth * 0.063,
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
                height: screenHeight * 0.5,
              ),
              FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.teal.shade500,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.05,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: TextButton(
                    onPressed: () {
                      // Navigation to Signup Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'CONTINUE',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 2),
                    ),
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
