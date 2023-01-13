import 'package:chatbot/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _inputMessage = TextEditingController();
  List<ChatMessage> _messages = [];

  void sendMessage() {
    ChatMessage chatMessage =
        ChatMessage(text: _inputMessage.text, sender: "Fahim");

    setState(() {
      _messages.insert(0, chatMessage);
    });
    _inputMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Playground'),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 55, 201, 165),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
            child: ListView.separated(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
              separatorBuilder: (context, index) => SizedBox(height: 17),
            ),
          ),
        ),
        //Flexible(child: Container(height: double.infinity)),
        customTextFieldWIdget(),
      ]),
    );
  }

  Padding customTextFieldWIdget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _inputMessage,
                onSubmitted: (value) => sendMessage(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  hintStyle: TextStyle(fontSize: 14),
                  hintText: "Type anything",
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  contentPadding: EdgeInsets.only(left: 20),
                ),
              ),
            ),
            IconButton(
              onPressed: () => sendMessage(),
              icon: Icon(Icons.send_rounded, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
