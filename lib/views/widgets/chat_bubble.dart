import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 32,
          bottom: 32,
          top: 32,
        ),
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          'message.message',
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 32,
          bottom: 32,
          top: 32,
        ),
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          'message.message',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
