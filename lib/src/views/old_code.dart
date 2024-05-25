// Old Code:

  // final List<CameraDescription> cameras;
  // const CameraScreen({super.key, required this.cameras});

  // late List<CameraDescription> _cameras;

  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();

  //   _cameras = await availableCameras();
  //   runApp(CameraScreen(cameras: _cameras));
  //   // runApp(const CameraScreen());
  // }

  // final cameras = await availableCameras();
  // if (cameras.isNotEmpty) {
  //   controller = CameraController(cameras[0], ResolutionPreset.max);
  //   _initializeControllerFuture = controller.initialize();
  //   controller.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
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
  //     }
  //   });
  // }

    // @override
  // void initState() {
  //   super.initState();
  //   controller = CameraController(_cameras[0], ResolutionPreset.max);
  // controller.initialize().then((_) {
  //   if (!mounted) {
  //     return;
  //   }
  //   setState(() {});
  // }).catchError((Object e) {
  //   if (e is CameraException) {
  //     switch (e.code) {
  //       case 'CameraAccessDenied':
  //         // Handle access errors here.
  //         break;
  //       default:
  //         // Handle other errors here.
  //         break;
  //     }
  //   }
  // });
  // }

    // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       title: const Row(
  //         children: [
  //         Icon(Icons.food_bank, color: Colors.green, size: 40),
  //         SizedBox(width: 20),
  //         Text("Food Focus", style: TextStyle(color: Colors.green)), ]
  //       ),
  //       backgroundColor: Colors.white,
  //       elevation: 0.0
  //     ),
  //     body: FutureBuilder<void>(
  //       future: _initializeControllerFuture,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           if (!controller.value.isInitialized) {
  //             return Container();
  //           }
  //           return Center(
  //             child: SizedBox(
  //               height: MediaQuery.of(context).size.height * 0.95,
  //               width: MediaQuery.of(context).size.width * 0.95,
  //               child: CameraPreview(controller),
  //             ),
  //           );
  //         } else {
  //           return const Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     ),

  //   );
  // }