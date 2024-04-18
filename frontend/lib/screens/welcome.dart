import 'package:flutter/material.dart';
import 'package:frontend/screens/Homepage/homepage.dart';
import 'package:frontend/utils/helper_functions.dart';
import 'package:frontend/widgets/custom_elevated_button.dart';
import 'package:frontend/widgets/privacy_policy.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111b21),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/splash_dark.png",
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to WhatsApp",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const PrivacyPolicy(),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  text: "AGREE AND CONTINUE",
                  ontap: () {
                    HelperFunctions.nextScreen(context, HomePage());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
