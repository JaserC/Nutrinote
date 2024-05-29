import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:async';

/// CameraApp is the Main Application.
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late var controller;
  late Future<void>? _initializeControllerFuture = Future.value(null);

  late bool _ready = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final statusCam = await Permission.camera.request();
    final statusMic = await Permission.microphone.request();
    if (statusCam.isGranted && statusMic.isGranted) {
      setState(() {
        _ready = true;
      });
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(cameras[0], ResolutionPreset.max);
        _initializeControllerFuture = controller.initialize();
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Row(children: [
            Icon(Icons.food_bank, color: Colors.green, size: 40),
            SizedBox(width: 20),
            Text("Food Focus", style: TextStyle(color: Colors.green)),
            // IconButton(onPressed: _takePicture, icon: Icon(Icons.camera))
          ]),
          backgroundColor: Colors.white,
          elevation: 0.0),
      body: (_ready)
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (controller.value.isInitialized) {
                    return Container();
                  }
                  return Stack(children: [
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.95,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: CameraPreview(controller),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Visibility(
                                visible: controller.value.isInitialized,
                                child: FloatingActionButton(
                                  onPressed: () async {
                                    try {
                                      await _initializeControllerFuture;

                                      final image =
                                          await controller.takePicture();

                                      if (!context.mounted) return;

                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              displayPictureScreen(
                                            image: image,
                                          ),
                                        ),
                                      );
                                    } catch (e) {
                                      // If an error occurs, log the error to the console.
                                      print(e);
                                    }
                                  },
                                  child: const Icon(Icons.camera_alt),
                                )))),
                  ]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : const Center(
              child: Text('Waiting for permissions...',
                  style: TextStyle(fontSize: 16))),
    );
  }

  Widget displayPictureScreen({required XFile image}) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(image.path)),
    );
  }
}
