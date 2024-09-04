import 'package:chat_app/constants.dart';
import 'package:chat_app/views/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  TextEditingController controller = TextEditingController();

  static const String routeName = "chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const Text('Flash chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return ChatBubbleForFriend();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
