import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class viewStats extends StatelessWidget {
  viewStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          title: Text('Mirador'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.teal.shade100,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      peopleCount(
                        Name: "Undergraduates",
                        Value: 1559,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      peopleCount(
                        Name: "Postgraduates",
                        Value: 1559,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      peopleCount(
                        Name: "Faculty",
                        Value: 1559,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AboutBuildingContainer(),
              gallery(),
              SizedBox(
                height: 15,
              ),
              ImportantLinks(),
              SizedBox(
                height: 40,
              ),
              Footer(),
            ],
          ),
        ));
  }
}

class AboutBuildingContainer extends StatelessWidget {
  const AboutBuildingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.teal.shade50,
      child: Column(
        children: [
          Image(
            image: NetworkImage(
                'https://seecs.nust.edu.pk/wp-content/uploads/2020/05/seecs-new.jpg'),
            width: screenWidth,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Welcome to Seecs',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'In the current age of rapid progress, only those fired with a passion to excel can aspire for a respectable survival. We at NUST-SEECS are committed to provide world class education and research opportunities in Pakistan. The School offers postgraduate and undergraduate programmes covering the disciplines of electrical engineering, software engineering and computer science. These programmes blending digital systems, communication technologies, power and control systems, Artificial Intelligence, data science, information security, robotics, and other information',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child:
                    ElevatedButton(onPressed: () {}, child: Text('Read More'))),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class peopleCount extends StatelessWidget {
  final String Name;
  final int Value;
  const peopleCount({required this.Name, required this.Value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          ('$Value'),
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          ('$Name'),
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}

class gallery extends StatelessWidget {
  const gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Departments',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              ImageWithText(
                Url: 'images/SEECS_UG.JPG',
                description: 'UG',
              ),
              SizedBox(
                width: 25,
              ),
              ImageWithText(
                Url: 'images/SEECS_PG.JPG',
                description: 'PG',
              ),
              SizedBox(
                width: 25,
              ),
              ImageWithText(
                Url: 'images/IAEC.JPG',
                description: 'IAEC',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageWithText extends StatelessWidget {
  final String Url;
  final String description;
  const ImageWithText({required this.Url, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage('$Url'),
          width: 100,
          height: 100,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$description',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}

class ImportantLinks extends StatelessWidget {
  const ImportantLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal.shade50,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ' Important Links',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LinkToLoc(
                name: "LMS",
              ),
              SizedBox(
                width: 20,
              ),
              LinkToLoc(
                name: "Qalam",
              ),
              SizedBox(
                width: 20,
              ),
              LinkToLoc(
                name: "Support",
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class LinkToLoc extends StatelessWidget {
  const LinkToLoc({required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.teal.shade900,
          borderRadius: BorderRadius.circular(5),
        ),
        width: 90,
        height: 70,
        padding: EdgeInsets.all(10),
        child: Center(
          child: TextButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text(
              '$name',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.teal.shade50, width: screenWidth, child: Container());
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Important Links"),
    content: Column(
      children: [
        Text(
          'Lms : https://lms.nust.edu.pk/portal/',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Qalam : https://qalam.nust.edu.pk/website/info',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Support desk : http://support.seecs.edu.pk/',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.teal,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
