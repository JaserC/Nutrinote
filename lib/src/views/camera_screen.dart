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

  // Future<void> _initializeCamera() async {
  //   final statusCam = await Permission.camera.request();
  //   final statusMic = await Permission.microphone.request();
  //   if (statusCam.isGranted && statusMic.isGranted) {
  //     setState(() {
  //       _isPermissionGrantedCamera = true;
  //       _isPermissionGrantedMicrophone = true;
  //     });
  //     final cameras = await availableCameras();
  //     if (cameras.isNotEmpty) {
  //       controller = CameraController(cameras[0], ResolutionPreset.max);
  //       _initializeControllerFuture = controller.initialize();
  //       setState(() {});
  //     }
  //   } else {
  //     setState(() {
  //       _isPermissionGrantedCamera = false;
  //       _isPermissionGrantedMicrophone = false;
  //     });
  //   }
  // }

  Future<void> _initializeCamera() async {
    setState(() {
      _isPermissionGrantedCamera = true;
      _isPermissionGrantedMicrophone = true;
    });
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.max);
      _initializeControllerFuture = controller.initialize();
      setState(() {});
    }
  }

  // Future<void> _initializeCamera() async {
  //   final cameras = await availableCameras();
  //   controller = CameraController(cameras[0], ResolutionPreset.max);
  //   controller.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {
  //       _isPermissionGrantedCamera = true;
  //       _isPermissionGrantedMicrophone = true;
  //     });
  //   }).catchError((Object e) {
  //     if (e is CameraException) {
  //       switch (e.code) {
  //         case 'CameraAccessDenied':
  //           // Handle access errors here.
  //           break;
  //         default:
  //           // Handle other errors here.
  //           break;
  //       }
  //       ;
  //     }
  //   });
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Future<void> _takePicture() async {
  //   if (controller.value.isInitialized) {
  //     final isPermissionGrantedStorage = await Permission.storage.request();
  //     if (isPermissionGrantedStorage == PermissionStatus.granted) {
  //       print("message 1");
  //       final imageLocation = await getTemporaryDirectory(); // error
  //       print("message 2");
  //       final imagePath = join(imageLocation.path, '${DateTime.now()}.png');
  //       print(imagePath);
  //       print("message 3");
  //       XFile picture = await controller.takePicture();
  //       print("message 4");
  //       await picture.saveTo(imagePath);
  //       print('Picture taken successfully');
  //     } else {
  //       print("Storage permission is required");
  //     }
  //   } else {
  //     print('Camera is not available at the moment');
  //   }
  // }

  // Future<void> _entireOp() async {
  //   XFile? picture = await _takePicture();
  //   if (picture != null) {
  //     await _storePicture(picture);
  //   }
  //   else {
  //     print('Picture was null');
  //   }
  // }

  // Future<XFile?> _takePicture() async {
  //   if (controller.value.isInitialized) {
  //     XFile picture = await controller.takePicture();
  //     print('takePicture is called');
  //     return picture;
  //   }
  //   else {
  //     return null;
  //   }
  // }

  // Future<String> _storePicture(XFile picture) async {
  //   print('Beginning of storePicture method');
  //   final imageLocation = await getTemporaryDirectory();
  //   print('getTemporaryDirectory has been called');
  //   final imagePath = join(imageLocation.path, '${DateTime.now()}.png');
  //   print(imagePath);
  //   print('imagePath has been printed');
  //   await picture.saveTo(imagePath);
  //   print('Picture saved successfully');
  //   return imagePath;
  // }

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
                                                  displayPic(image)));
                                    } catch (e) {
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

  Widget displayPic(XFile context) {
    return Image.file(File(context.path));
  }
}
