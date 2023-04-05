import 'package:flutter/material.dart';

class viewStats extends StatelessWidget {
  const viewStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        title: Text('Mirador'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                'STATS DISPLAYED HERE',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              )),
        ],
      ),
    );
  }
}
