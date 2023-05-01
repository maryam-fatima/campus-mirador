import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetFeedback extends StatelessWidget {
  const GetFeedback({required this.username, required this.feedback});
  final String username;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double circleAvatarRadius = screenSize.width * 0.05;
    final double buttonFontSize = screenSize.width * 0.05;

    return Container(
      width: screenSize.width * 0.9,
      height: screenSize.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.teal.shade400,
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade900,
              radius: circleAvatarRadius,
              child: Icon(
                Icons.account_circle_outlined,
                size: circleAvatarRadius * 0.6,
              ),
            ),
            SizedBox(
              width: screenSize.width * 0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username :   $username',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: screenSize.width * 0.035)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Text(
                    'Response : $feedback',
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: screenSize.width * 0.035)),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: screenSize.width * 0.035,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: screenSize.width * 0.035,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: screenSize.width * 0.035,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: screenSize.width * 0.035,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.yellowAccent,
                        size: screenSize.width * 0.035,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
