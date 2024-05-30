import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:food_focus/src/utils/gemini.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:async';

import 'package:provider/provider.dart';

/// CameraApp is the Main Application.
class CameraScreen extends StatefulWidget {
  /// Default Constructor
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  Future<void>? _initializeControllerFuture;

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
    if (controller.value.isInitialized) {
      controller.dispose();
    }
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
    return Consumer<HistoryProvider>(builder: (context, provider, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Row(children: [
              Image.asset('assets/images/food_focus_logo.png',
                  width: 40, height: 40),
              const SizedBox(width: 10),
              const Text("Food Focus", style: TextStyle(color: Colors.green)),
            ]),
            backgroundColor: Colors.white,
            elevation: 0.0),
          body: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (!controller.value.isInitialized) {
                  return errorDisplay(
                      context); //Ends up here if one of 2 permissions not given
                }
                return Stack(children: [
                  Center(
                    child: SizedBox(
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

                                    String response =
                                        await Gemini.identifyImage(image);
                                    String responseParse = response.toString();

                                    List<String> responseTokens =
                                        responseParse.split('\n');
                                    String foodName = responseTokens[0];
                                    List<String> nutritionalInfo =
                                        responseTokens.sublist(1);

                                    provider.add(FoodItem(
                                        mealName: foodName,
                                        mealImagePath: image.path,
                                        nutritionFacts: nutritionalInfo));

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
          ));
    });
  }

  Widget errorDisplay(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Semantics(
              label: 'A gif of a compass turning',
              child: Image.asset('assets/images/error.gif')),
          const Text("Uh Oh!",
              style: TextStyle(
                  fontFamily: 'Shantell Sans',
                  fontSize: 64.0,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 170, 211, 255))),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            child: const Text(
              "It looks like you are trying to use a camera without giving us permissions. Please manually give us camera AND microphone permissions in your settings, close the app, and try again!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Shantell Sans',
                  fontSize: 17.0,
                  color: Color.fromARGB(255, 54, 149, 252)),
            ),
          )
        ],
      ),
    );
  }

  Widget displayPic(XFile context) {
    return Image.file(File(context.path));
  }
}
