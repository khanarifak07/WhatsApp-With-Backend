import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/Homepage/homepage.dart';
import 'package:frontend/utils/helper_functions.dart';
import 'package:frontend/widgets/create_contact.card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ChatModel? sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
      name: "Arif",
      currentMessage: "Some randome message",
      time: "4:18",
      isGroup: false,
      icon: Icons.person,
      status: "",
      id: 1,
    ),
    ChatModel(
      name: "Sameer",
      currentMessage: "Sameer ka message",
      time: "18:40",
      isGroup: false,
      icon: Icons.person,
      status: "",
      id: 2,
    ),
    ChatModel(
      name: "Hitesh",
      currentMessage: "Group messages",
      time: "19:45",
      isGroup: false,
      icon: Icons.person,
      status: "",
      id: 3,
    ),
    ChatModel(
      name: "Suresh",
      currentMessage: "Group messages",
      time: "19:45",
      isGroup: false,
      icon: Icons.person,
      status: "",
      id: 4,
    ),
    ChatModel(
      name: "Ajay",
      currentMessage: "Group messages",
      time: "19:45",
      isGroup: false,
      icon: Icons.person,
      status: "",
      id: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: chatModels.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              sourceChat = chatModels.removeAt(index);
              HelperFunctions.nextScreen(
                  context,
                  HomePage(
                    chatModel: chatModels,
                    sourceChat: sourceChat,
                  ));
            },
            child: CreateContactCard(
              name: chatModels[index].name,
              icon: Icons.person,
            ),
          );
        },
      ),
    );
  }
}
