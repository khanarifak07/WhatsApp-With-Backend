import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class CreateContactCard extends StatelessWidget {
  final String name;
  final IconData icon;
  const CreateContactCard({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.newGreen,
          child: Icon(icon),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
