import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewPage extends StatefulWidget {
  final XFile? videoPath;
  const VideoPreviewPage({super.key, required this.videoPath});

  @override
  State<VideoPreviewPage> createState() => _VideoPreviewPageState();
}

class _VideoPreviewPageState extends State<VideoPreviewPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath!.path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

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
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Center(
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey.shade800,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
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
