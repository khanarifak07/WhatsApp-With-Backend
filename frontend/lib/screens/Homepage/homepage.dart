import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/CameraAndVideo/camera_page.dart';
import 'package:frontend/screens/Chats/chat_page.dart';

class HomePage extends StatefulWidget {
  final List<ChatModel>? chatModel;
  ChatModel? sourceChat;

  HomePage({super.key, this.chatModel, this.sourceChat});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //In summary, SingleTickerProviderStateMixin is used when you have a single animation controller,
  // while TickerProviderStateMixin is used when you have multiple animation controllers.
  //They both enable efficient animation management by providing a TickerProvider for animations.
  late final tabController =
      TabController(length: 4, vsync: this, initialIndex: 1);

  //dipose the controllers to prevent memory leaks
  @override
  void dispose() {
    tabController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff111b21),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "WhatsApp",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 15),
                  PopupMenuButton(
                    color: theme.primary,
                    onSelected: (value) => log(value),
                    itemBuilder: ((context) {
                      return [
                        const PopupMenuItem(
                          value: "New Group",
                          child: Text("New Group"),
                        ),
                        const PopupMenuItem(
                          value: "New Broadcast",
                          child: Text("New Broadcast"),
                        ),
                        const PopupMenuItem(
                          value: "WhatsApp Web",
                          child: Text("WhatsApp Web"),
                        ),
                        const PopupMenuItem(
                          value: "Starred Messages",
                          child: Text("Starred Messages"),
                        ),
                        const PopupMenuItem(
                          value: "Settings",
                          child: Text("Settings"),
                        ),
                      ];
                    }),
                  ),
                ],
              ),
            ),
          ],
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: const [
                SizedBox(
                  width: 50,
                  child: Tab(
                    child: Icon(Icons.camera_alt, color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "CHATS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "STATUS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "CALLS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            const CameraPage(),
            ChatPage(
              chatModels: widget.chatModel,
              sourceChat : widget.sourceChat,
            ),
            const Center(child: Text("data3")),
            const Center(child: Text("data4")),
          ],
        ),
      ),
    );
  }
}
