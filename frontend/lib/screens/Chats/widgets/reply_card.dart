import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: const Card(
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: AppColors.replyCardColor,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 70,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Text("message mesfsdfjsfsjf fs jfij fsidjfijfskfjsf"),
              ),
              Positioned(
                right: 5,
                bottom: 1,
                child: Text(
                  "18:30",
                  style: TextStyle(color: Colors.white60),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
