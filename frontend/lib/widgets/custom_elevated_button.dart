import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() ontap;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 42,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          splashFactory: NoSplash.splashFactory,
          backgroundColor: theme.secondary,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
