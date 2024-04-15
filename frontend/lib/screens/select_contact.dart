import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/create_group.dart';
import 'package:frontend/utils/helper_functions.dart';
import 'package:frontend/widgets/contact_card.dart';
import 'package:frontend/widgets/create_contact.card.dart';

class SelectContactPage extends StatelessWidget {
  const SelectContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    List<ChatModel> contacts = [
      ChatModel(
          name: "Arif",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp"),
      ChatModel(
          name: "Hassan",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp"),
      ChatModel(
          name: "Sameer",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp"),
      ChatModel(
          name: "Test",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp"),
      ChatModel(
          name: "Test",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp"),
      ChatModel(
          name: "Test",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp"),
      ChatModel(
          name: "Test",
          currentMessage: "",
          time: " ",
          isGroup: false,
          icon: Icons.person,
          status: "Hey there! I am using WhatsApp")
    ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 16),
            InkWell(
              onTap: () {},
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Contact",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "145 Contacts",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            color: theme.primary,
            onSelected: (value) => log(value),
            itemBuilder: ((context) {
              return [
                const PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                const PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                const PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                const PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            }),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                HelperFunctions.nextScreen(context, const CreateGroupPage());
              },
              child: const CreateContactCard(
                icon: Icons.person_add,
                name: 'New Contact',
              ),
            );
          } else if (index == 1) {
            return const CreateContactCard(
              icon: Icons.group_add,
              name: 'New Group',
            );
          }
          return ContactCard(
            chatModel: contacts[index - 2],
          );
        },
      ),
    );
  }
}
