import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/CameraAndVideo/camera_preview.dart';
import 'package:frontend/screens/CameraAndVideo/video_preview.dart';
import 'package:frontend/utils/helper_functions.dart';

List<CameraDescription> cameras = [];

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with SingleTickerProviderStateMixin {
  late var _cameraController =
      CameraController(cameras[0], ResolutionPreset.high);

  late Future<void> cameraValue = _cameraController.initialize();

  @override
  void dispose() {
    super.dispose();
    //dispose the controller to prevent memory leakage
    _cameraController.dispose();
  }

  bool isRecording = false;
  bool isFlash = true;
  bool isCamFront = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: cameraValue,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.black,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * .15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          isFlash
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                          setState(() {
                            isFlash = !isFlash;
                          });
                        },
                        icon: Icon(isFlash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white, size: 35)),
                    GestureDetector(
                      onLongPress: () async {
                        startRecording();
                      },
                      onLongPressUp: () async {
                        XFile? videoFile = await stopRecording();
                        setState(() {
                          isRecording = false;
                        });
                        HelperFunctions.nextScreen(
                            context, VideoPreviewPage(videoPath: videoFile));
                      },
                      child: IconButton(
                          onPressed: () {
                            if (!isRecording) {
                              takePhoto(context);
                              //Flash mode off
                              _cameraController.setFlashMode(FlashMode.off);
                            }
                          },
                          icon: isRecording
                              ? const Icon(Icons.radio_button_on,
                                  color: Colors.red, size: 80)
                              : const Icon(Icons.panorama_fish_eye,
                                  color: Colors.white, size: 80)),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isCamFront = !isCamFront;
                          });
                          int cameraPos = isCamFront ? 0 : 1;

                          _cameraController = CameraController(
                              cameras[cameraPos], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                        },
                        icon: const Icon(Icons.flip_camera_ios,
                            color: Colors.white, size: 35)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Hold for video, tap for photo")
              ],
            ),
          ),
        ),
      ],
    );
  }

//click photo
  void takePhoto(BuildContext context) async {
    XFile? path = await _cameraController.takePicture();
    //navigate to the preview screen
    HelperFunctions.nextScreen(context, CameraPreviewPage(imagePath: path));
  }

  //record video
  void startRecording() async {
    await _cameraController.startVideoRecording();
    setState(() {
      isRecording = true;
    });
  }

  //stop recording
  Future<XFile?> stopRecording() async {
    XFile? videoFile = await _cameraController.stopVideoRecording();
    setState(() {
      isRecording = false;
    });
    return videoFile;
  }

  /* void takePhoto(BuildContext context) async {
    // Using path_provider to get the temp path
    final path =
        join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

    // Start image streaming for the camera preview
    await _cameraController.startImageStream((CameraImage image) {
      // Save the image to the specified path
      File(path).writeAsBytes(image.planes[0].bytes);

      // Stop image streaming after capturing the picture
      _cameraController.stopImageStream();

      // Navigate to the next screen passing the image path
      HelperFunctions.nextScreen(context, CameraPreviewPage(path: path));
    });

    // Take the picture
    await _cameraController.takePicture();
  } */
}
