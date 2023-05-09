// imported the required libraries
import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatbot/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:progress_indicators/progress_indicators.dart';

// This screen is Chat-bot screen , It is integrated with the ChatGPT.

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _inputMessage = TextEditingController();
  List<ChatMessage> _messages = [];
  ChatGPT? chatGPT;

  StreamSubscription? subscription;
  bool isTyping = false;

  @override
  void initState() {
    chatGPT = ChatGPT.instance;
    super.initState();
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  void sendMessage() {
    ChatMessage chatMessage =
        ChatMessage(text: _inputMessage.text, sender: "user");

    setState(() {
      _messages.insert(0, chatMessage);
      isTyping = true;
    });
    _inputMessage.clear();

    final request = CompleteReq(
        prompt: chatMessage.text, model: kTranslateModelV3, max_tokens: 200);

    subscription = chatGPT!
        .builder('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',
            orgId: '')
        .onCompleteStream(request: request)
        .listen((response) {
      ChatMessage botMessage =
          ChatMessage(text: response!.choices[0].text, sender: "🤖");

      setState(() {
        isTyping = false;
        try {
          print(response.choices[0].text);
          _messages.insert(0, botMessage);
        } catch (e) {
          print('Failed');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mirador HelpGPT'),
        elevation: 0,
        backgroundColor: Colors.teal.shade900,
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: height * 0.01,
              left: width * 0.03,
              right: width * 0.03,
            ),
            child: ListView.separated(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
            ),
          ),
        ),
        if (isTyping)
          JumpingDotsProgressIndicator(
            fontSize: 48.0,
          ),
        customTextFieldWIdget(),
      ]),
    );
  }

  Padding customTextFieldWIdget() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _inputMessage,
                onSubmitted: (value) => sendMessage(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  hintStyle: const TextStyle(fontSize: 14),
                  hintText: "Type anything",
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  contentPadding: const EdgeInsets.only(left: 20),
                ),
              ),
            ),
            IconButton(
              onPressed: () => sendMessage(),
              icon: const Icon(Icons.send_rounded, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
