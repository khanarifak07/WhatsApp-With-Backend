import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: theme.secondary,
          child: const Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 75,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Text("message mesfsdfjsfsjf fs jfij fsidjfijfskfjsf"),
              ),
              Positioned(
                right: 5,
                bottom: 1,
                child: Row(
                  children: [
                    Text(
                      "18:30",
                      style: TextStyle(color: Colors.white60),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.check)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
