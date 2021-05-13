import 'package:camera/camera.dart';
import 'package:camera_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

GlobalKey<ScaffoldState> _scaffoldkey= GlobalKey<ScaffoldState>();


class _CameraScreenState extends State<CameraScreen> {

  CameraController controller;
  XFile file;
  int cameraType=0;
  int flashType=0;
  Icon flashicon=Icon(Icons.flash_on);

  @override
  void initState()  {
    super.initState();
    setCameraType();


  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(

        children: [
          Container(child: CameraPreview(controller)),
          Positioned(
            height: 180.h,
            width: 100.w,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    icon: flashicon,
                    onPressed: () {
                      if(flashType==0){
                        controller.setFlashMode(FlashMode.torch);
                        flashType=1;
                        setState(() {
                          flashicon=Icon(Icons.flash_off);
                        });

                      }
                      else{
                        controller.setFlashMode(FlashMode.off);
                        flashType=0;
                        setState(() {
                          flashicon=Icon(Icons.flash_on);
                        });

                      }
                    },
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 60,
                    icon: Icon(Icons.camera),
                    onPressed: ()async {
                      file = await controller.takePicture();
                      print(file.path);
                    },
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    icon: Icon(Icons.rotate_90_degrees_ccw),
                    onPressed: () {
                      cameraType==0?cameraType=1:cameraType=0;
                      setCameraType();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
  setCameraType(){
    controller = CameraController(cameras[cameraType], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    
  }
}
