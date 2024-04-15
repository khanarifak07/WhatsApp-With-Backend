import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "Read Our",
            style: const TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: "\t\tPrivacy Policy.\t\t",
                  style: TextStyle(color: theme.tertiary)),
              const TextSpan(text: "Tap \"Agree and Continue\" to accept the"),
              TextSpan(
                  text: "\t\tTerms of Services.",
                  style: TextStyle(color: theme.tertiary)),
            ]),
      ),
    );
  }
}
