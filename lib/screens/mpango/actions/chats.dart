import 'package:flutter/material.dart';
import 'package:slms/widgets/chat_bubble.dart';
import 'package:slms/widgets/custom_tff.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final msg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ListView(
              children: const [
                ChatBubble(
                  text: 'Oy, wassa',
                  isCurrentUser: true,
                ),
              ],
            ),
            Form(
              child: Row(
                children: [
                  CustomTff(
                    text: 'Message',
                    alertMessage: 'Enter message',
                    controller: msg,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
