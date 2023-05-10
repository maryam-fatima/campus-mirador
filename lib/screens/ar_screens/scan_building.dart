// imported all the required libraies
import 'dart:io';
import 'package:flutter/material.dart';
import '../features/chat_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../video_screen.dart';
import 'ar_overlay.dart';

// This screens direct us to AR Overlay screen , where you will capture the image
// of the building and at the real time you will get to see the AR Overlay for it

class ScanBuilding extends StatefulWidget {
  const ScanBuilding({Key? key}) : super(key: key);

  @override
  State<ScanBuilding> createState() => _ScanBuildingState();
}

class _ScanBuildingState extends State<ScanBuilding> {
  File? image;

  // this method will let you pick the image from gallery
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      print('click');
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to open image ,$e');
    }
  }

  // this method will let you capture the image from camera
  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      print('click');
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to open image ,$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenHeight = size.height - appBarHeight - statusBarHeight;
    final screenWidth = size.width;
    final isPortrait = size.height > size.width;

    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: const Text('Mirador'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Text(
                  'Scanning in Progress',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: isPortrait ? 20 : 30,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade500,
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.all(2),
                child: SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      //pickImageC();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoScreen()),
                      );
                    },
                    child: Text(
                      'Scan the building',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade900,
                    borderRadius: BorderRadius.circular(5)),
                child: SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AROverlay()),
                      );
                    },
                    child: Text(
                      'AR Overlay',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.65, screenWidth * 0.42, 0, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.teal.shade200,
                    radius: screenWidth * 0.2,
                    child: const Image(
                      image: AssetImage('images/bot.png'),
                      width: 99,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
