// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';

class AvatarCard extends StatefulWidget {
  ChatModel chatModel;
  AvatarCard({
    super.key,
    required this.chatModel,
  });

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.clear,
                    size: 15,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(widget.chatModel.name)
        ],
      ),
    );
  }
}
