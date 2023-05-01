import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Container_Menu extends StatelessWidget {
  Container_Menu(
      {required this.image_path,
      required this.label_text,
      required this.label_text_description,
      required this.video_text});
  final String image_path;
  final String label_text;
  final String label_text_description;
  final String video_text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal,
      ),
      width: screenSize.width * 0.8,
      height: screenSize.width * 0.45,
      child: Row(
        children: [
          SizedBox(
            width: 0.053 * screenSize.width,
          ),
          Flexible(
            child: Image(
              image: AssetImage(image_path),
              width: screenSize.width * 0.2,
              height: screenSize.width * 0.2,
            ),
          ),
          SizedBox(
            width: 0.05 * screenSize.width,
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: screenSize.width * 0.2,
              height: screenSize.width * 0.25,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '  ${label_text}  ',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w600,
                        fontSize: screenSize.width * 0.035,
                      )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '   ${label_text_description}  ',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: screenSize.width * 0.028,
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: screenSize.width * 0.4,
                    height: screenSize.width * 0.09,
                    decoration: BoxDecoration(
                        color: Colors.teal.shade900,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.video,
                          color: Colors.white,
                          size: screenSize.width * 0.04,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ' ${video_text}',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: screenSize.width * 0.032,
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
