import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/widgets/avatar_card.dart';
import 'package:frontend/widgets/contact_card.dart';

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  List<ChatModel> contacts = [
    ChatModel(
        id: 1,
        name: "Arif",
        currentMessage: "",
        time: " ",
        isGroup: false,
        icon: Icons.person,
        status: "Hey there! I am using WhatsApp"),
    ChatModel(
        id: 2,
        name: "Hassan",
        currentMessage: "",
        time: " ",
        isGroup: false,
        icon: Icons.person,
        status: "Hey there! I am using WhatsApp"),
    ChatModel(
        id: 3,
        name: "Sameer",
        currentMessage: "",
        time: " ",
        isGroup: false,
        icon: Icons.person,
        status: "Hey there! I am using WhatsApp"),
    ChatModel(
        id: 4,
        name: "Test",
        currentMessage: "",
        time: " ",
        isGroup: false,
        icon: Icons.person,
        status: "Hey there! I am using WhatsApp"),
    ChatModel(
        id: 5,
        name: "Test",
        currentMessage: "",
        time: " ",
        isGroup: false,
        icon: Icons.person,
        status: "Hey there! I am using WhatsApp"),
    ChatModel(
        id: 6,
        name: "Test",
        currentMessage: "",
        time: " ",
        isGroup: false,
        icon: Icons.person,
        status: "Hey there! I am using WhatsApp"),
  ];

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

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
                    "New Group",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Add participants",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 90 : 10,
                );
              }

              return InkWell(
                onTap: () {
                  if (contacts[index - 1].select == false) {
                    setState(() {
                      contacts[index - 1].select = true;
                      groups.add(contacts[index - 1]);
                      print(groups);
                    });
                  } else {
                    setState(() {
                      contacts[index - 1].select = false;
                      groups.remove(contacts[index - 1]);
                    });
                  }
                },
                child: ContactCard(
                  chatModel: contacts[index - 1],
                ),
              );
            },
          ),
          if (groups.isNotEmpty)
            Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .08,
                  color: theme.primary,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (contacts[index].select == true) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              contacts[index].select = false;
                              groups.remove(contacts[index]);
                            });
                          },
                          child: AvatarCard(
                            chatModel: contacts[index],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: theme.inversePrimary,
                )
              ],
            )
        ],
      ),
    );
  }
}
