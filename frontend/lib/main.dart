import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/CameraAndVideo/camera_page.dart';
import 'package:frontend/screens/Login/login_page.dart';
import 'package:frontend/utils/theme/theme.dart';

Future<void> main() async {
  // Example usage
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Me',
      home: const LoginPage(),
      theme: darkMode,
    );
  }
}
