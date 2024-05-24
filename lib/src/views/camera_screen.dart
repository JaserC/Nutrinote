import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// CameraApp is the Main Application.
class CameraScreen extends StatefulWidget {
  /// Default Constructor
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  late Future<void> _initializeControllerFuture;
  
  bool _isPermissionGrantedCamera = false;
  bool _isPermissionGrantedMicrophone = false;

  @override
  void initState() {
    super.initState();
    _initialzeCamera();
  }

  Future<void> _initialzeCamera() async {
    final statusCam = await Permission.camera.request();
    final statusMic = await Permission.microphone.request();
    if (statusCam.isGranted && statusMic.isGranted) {
      setState(() {
        _isPermissionGrantedCamera = true;
        _isPermissionGrantedMicrophone = true;
      });
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        controller = CameraController(cameras[0], ResolutionPreset.max);
        _initializeControllerFuture = controller.initialize();
        controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        }).catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
                // Handle access errors here.
                break;
              default:
                // Handle other errors here.
                break;
            }
          }
        });
      }
    } else {
      setState(() {
        _isPermissionGrantedCamera = false;
        _isPermissionGrantedMicrophone = false;
      });
    }

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    final imageLocation = await getTemporaryDirectory(); // possible error
    final imagePath = join(imageLocation.path, '${DateTime.now()}.png');
    print(imagePath);
    XFile picture = await controller.takePicture();
    picture.saveTo(imagePath);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Row(children: [
            Icon(Icons.food_bank, color: Colors.green, size: 40),
            SizedBox(width: 20),
            Text("Food Focus", style: TextStyle(color: Colors.green)),
            IconButton(onPressed: _takePicture, icon: Icon(Icons.camera))
          ]),
          backgroundColor: Colors.white,
          elevation: 0.0),
      body: (_isPermissionGrantedCamera && _isPermissionGrantedMicrophone)
          ? FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (!controller.value.isInitialized) {
                    return Container();
                  }
                  return Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.95,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: CameraPreview(controller),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : const Center(
              child: Text('Waiting for camera and microphone permissions...',
                  style: TextStyle(fontSize: 16))),
    );
  }
}
