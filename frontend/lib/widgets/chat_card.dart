import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/Chats/individual_chat_page.dart';
import 'package:frontend/utils/helper_functions.dart';

class ChatCard extends StatelessWidget {
  final ChatModel chatModel;
  const ChatCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          HelperFunctions.nextScreen(
              context, IndividualChatPage(chatModel: chatModel));
        },
        child: ListTile(
          leading: chatModel.isGroup
              ? const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white60,
                  child: Icon(Icons.group),
                )
              : const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white60,
                  child: Icon(Icons.person),
                ),
          title: Text(
            chatModel.name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Row(
            children: [
              const Icon(Icons.check),
              const SizedBox(width: 6),
              Text(
                chatModel.currentMessage,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          trailing: Text(chatModel.time),
        ),
      ),
    );
  }
}
