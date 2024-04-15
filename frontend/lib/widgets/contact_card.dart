import 'package:flutter/material.dart';
import 'package:frontend/model/chat_model.dart';
import 'package:frontend/utils/colors.dart';

class ContactCard extends StatelessWidget {
  final ChatModel chatModel;
  const ContactCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: ListTile(
        leading: Stack(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white54,
              child: Icon(Icons.person),
            ),
            if (chatModel.select == true)
              const Positioned(
                bottom: 1,
                right: 1,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.newGreen,
                  child: Icon(
                    Icons.check,
                    size: 15,
                  ),
                ),
              )
          ],
        ),
        title: Text(
          chatModel.name,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          chatModel.status,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
