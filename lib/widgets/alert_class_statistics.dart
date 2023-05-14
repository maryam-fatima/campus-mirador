import 'package:flutter/material.dart';

class MyAlert extends StatelessWidget {
  const MyAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () {
          showAlertDialogLink(context);
        },
      ),
    );
  }
}

showAlertDialogLink(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Links"),
    content: SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'LMS',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'https://lms.nust.edu.pk/portal/',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Qalam',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'https://qalam.nust.edu.pk/',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Support',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'https://support.nust.edu.pk',
                style: TextStyle(color: Colors.blue),
              )
            ],
          )
        ],
      ),
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
