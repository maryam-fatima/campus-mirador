import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({Key? key, required this.text, required this.sender})
      : super(key: key);

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Container(
            height: 38,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: sender == 'user' ? Colors.blue[200] : Colors.red[50],
            ),
            child: Center(
              child: Text(
                sender,
                style: TextStyle(
                    color: Colors.black, fontSize: sender == 'user' ? 14 : 30),
              ),
            ),
          ),
        ),
        Expanded(
          child: SelectableText(text),
        ),
      ],
    );
  }
}
