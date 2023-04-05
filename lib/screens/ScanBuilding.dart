import 'dart:io';
import 'package:flutter/material.dart';
import 'HelpPage.dart';
import 'chat_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'AROverlay.dart';

class ScanBuilding extends StatefulWidget {
  const ScanBuilding({Key? key}) : super(key: key);

  @override
  State<ScanBuilding> createState() => _ScanBuildingState();
}

class _ScanBuildingState extends State<ScanBuilding> {
  File? image;

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
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text('Mirador'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Text(
                  'Scanning in Progress',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              image != null
                  ? Image.file(
                      image!,
                      width: 800,
                      height: 300,
                    )
                  : Text('No image selected'),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade500,
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(2),
                child: TextButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text(
                    'Select from Gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade500,
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(2),
                child: TextButton(
                  onPressed: () {
                    pickImageC();
                  },
                  child: Text(
                    'Select from Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.teal.shade900,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AROverlay()),
                    );
                  },
                  child: Text(
                    'Move to AR Overlay',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
