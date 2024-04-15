import 'dart:developer';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/screens/Chats/widgets/own_message_card.dart';
import 'package:frontend/screens/Chats/widgets/reply_card.dart';
import 'package:frontend/utils/app_images.dart';
import 'package:frontend/widgets/attachement_sheet.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualChatPage extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualChatPage({super.key, required this.chatModel});

  @override
  State<IndividualChatPage> createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  bool isTyping = false;
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController emojiController = TextEditingController();
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io(wifiUrl, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    //establish the connection
    socket.connect();
    //emit test
    socket.emit('/test', 'Hello Arif');
    //handle connection event
    socket.onConnect((data) => log("Connected to socket server"));
  }

  void disconnect() {
    socket.disconnect();
    log("Disconnected from Socket Server");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Image.asset(AppImages.chatbg),
        Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(widget.chatModel.isGroup == true
                      ? Icons.group
                      : Icons.person),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Last seen today",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
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
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: WillPopScope(
              onWillPop: () {
                if (showEmoji) {
                  setState(() {
                    showEmoji = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width - 50,
                                child: TextField(
                                  controller: emojiController,
                                  focusNode: focusNode,
                                  onChanged: (value) {
                                    setState(() {
                                      isTyping = value
                                          .isNotEmpty; //the value becomes true wile typing (onChange) if we delete message then value becomes false
                                    });
                                  },
                                  maxLines: 5,
                                  minLines: 1,
                                  cursorColor: theme.secondary,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(top: 5),
                                    hintText: "Message",
                                    prefixIcon: IconButton(
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          showEmoji = !showEmoji;
                                        });
                                      },
                                      icon: const Icon(
                                          Icons.emoji_emotions_outlined),
                                      color: theme.inversePrimary,
                                    ),
                                    suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    context: context,
                                                    builder: (context) {
                                                      return AttachmentSheet(
                                                          theme: theme);
                                                    });
                                              },
                                              icon:
                                                  const Icon(Icons.attach_file),
                                              color: theme.inversePrimary),
                                          const SizedBox(width: 10),
                                          isTyping
                                              ? const SizedBox.shrink()
                                              : Icon(
                                                  Icons.camera_alt,
                                                  color: theme.inversePrimary,
                                                )
                                        ],
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: const Color(0xff23bd63),
                                child: isTyping
                                    ? const Icon(Icons.send)
                                    : const Icon(Icons.mic),
                              )
                            ],
                          ),
                          showEmoji
                              ? SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .30,
                                  child: EmojiPicker(
                                    textEditingController: emojiController,
                                    onEmojiSelected: (category, emoji) {},
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
