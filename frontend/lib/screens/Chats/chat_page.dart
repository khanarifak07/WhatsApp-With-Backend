import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/select_contact.dart';
import 'package:frontend/utils/helper_functions.dart';
import 'package:frontend/widgets/chat_card.dart';

class ChatPage extends StatelessWidget {
  final List<ChatModel>? chatModels;
  final ChatModel? sourceChat;
  const ChatPage({super.key, this.chatModels, this.sourceChat});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;

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
        itemCount: chatModels!.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatCard(
            chatModel: chatModels![index],
            sourceChat: sourceChat,
          );
        },
      ),
    );
  }
}
