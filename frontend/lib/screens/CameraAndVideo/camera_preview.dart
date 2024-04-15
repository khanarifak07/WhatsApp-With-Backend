import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewPage extends StatelessWidget {
  final XFile? imagePath;
  const CameraPreviewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.crop_rotate)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.emoji_emotions_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.title)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height - 150,
              child: Image.file(
                File(imagePath!.path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.add_photo_alternate),
                    hintText: "Add Caption...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
