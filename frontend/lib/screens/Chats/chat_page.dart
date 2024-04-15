import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/select_contact.dart';
import 'package:frontend/utils/helper_functions.dart';
import 'package:frontend/widgets/chat_card.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    List<ChatModel> chats = [
      ChatModel(
        name: "Arif",
        currentMessage: "Some randome message",
        time: "4:18",
        isGroup: false,
        icon: Icons.person,
        status: "",
      ),
      ChatModel(
        name: "Sameer",
        currentMessage: "Sameer ka message",
        time: "18:40",
        isGroup: false,
        icon: Icons.person,
        status: "",
      ),
      ChatModel(
        name: "Universe Saat",
        currentMessage: "Group messages",
        time: "19:45",
        isGroup: true,
        icon: Icons.group,
        status: "",
      )
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HelperFunctions.nextScreen(context, const SelectContactPage());
        },
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatCard(
            chatModel: chats[index],
          );
        },
      ),
    );
  }
}
