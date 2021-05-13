import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'cameraScreen.dart';
import 'package:sizer/sizer.dart';

List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
       builder: (context, orientation, deviceType){
       return MaterialApp(
        home: CameraScreen(),
      );
     }
     );
  }
}