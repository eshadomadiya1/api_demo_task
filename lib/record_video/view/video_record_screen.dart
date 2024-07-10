import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:api_demo_task/record_video/controller/profile_video.dart';
import 'package:api_demo_task/record_video/widget/record_button.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/app_snackbar.dart';
import 'package:api_demo_task/widget/custom_loading_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateReels extends StatefulWidget {
  const CreateReels({Key? key}) : super(key: key);

  @override
  State<CreateReels> createState() => _CreateReelsState();
}

class _CreateReelsState extends State<CreateReels> with SingleTickerProviderStateMixin {
  final ProfileController _profileController = Get.put(ProfileController());
  CameraController? controller;
  List<CameraDescription> cameras = [];
  String videoPath = '';
  RxBool loading = true.obs;
  RxBool isControllerInitialized = false.obs;

  late AnimationController buttonAnimationController;

  // late AnimationController _animationController;
  // late Animation<double> _animation;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 15))
      //   ..addListener(() {
      //     setState(() {});
      //   });
      // _animation = Tween(begin: 0.0, end: 1.0).animate(
      //   CurvedAnimation(parent: _animationController, curve: Curves.linear),
      // );
      /* _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..addListener(() {
          setState(() {});
        });

      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));*/
      /*  _animationController
        ..forward()
        ..addListener(() {
          setState(() {});
        });*/
      buttonAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 100),
      );
      cameras = await availableCameras();
      controller = CameraController(
        cameras[0],
        ResolutionPreset.high,
      );
      try {
        await controller?.initialize();
      } on CameraException catch (e) {
        errorMessage = e.description;
      }

      isControllerInitialized.value = true;
      loading.value = false;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    // _animationController.dispose();
    super.dispose();
  }

  String minutesStr = '00';
  String secondsStr = '00';

  RxBool showTimer = false.obs;
  RxBool isRecordingOn = false.obs;

  void startRecording() async {
    if (!controller!.value.isInitialized) return;
    try {
      buttonAnimationController.forward();
      showTimer.value = true;
      isRecordingOn.value = true;
      // _animationController.forward(from: 0.0);
      await controller?.startVideoRecording();
    } catch (e, st) {
      LogUtils.errorLog('START RECORDING ERROR :: $e :: ST :: $st');
    }
  }

  bool isLargerThan300MB(XFile file) {
    int bytes = File(file.path).lengthSync();
    double sizeInMb = bytes / (1024 * 1024);
    if (sizeInMb > 300) {
      return true;
    }
    return false;
  }

  void stopRecording() async {
    if (!controller!.value.isRecordingVideo) return;

    try {
      buttonAnimationController.reverse();
      // _animationController.stop(canceled: false);
      showTimer.value = false;
      isRecordingOn.value = false;
      XFile? videoData = await controller?.stopVideoRecording();
      videoPath = videoData?.path ?? "";
      if (videoData == null) {
        AppSnackBar.showSnackBarAtTop(message: "No video file found!", title: "Error",);
      } else if (isLargerThan300MB(videoData)) {
        AppSnackBar.showSnackBarAtTop(message: "Please select a file smaller than 300 MB", title: "Error", );
      } else {
        // _animationController.dispose();
        Navigation.pushNamed(Routes.createdVideoPlayScreen, arg: videoPath);
      }
    } catch (e, st) {
      LogUtils.errorLog('STOP RECORDING ERROR :: $e :: ST $st');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double cameraAspectRatio = 0.0;
    if (errorMessage == null) {
      cameraAspectRatio = (controller?.value.aspectRatio ?? 0) * 0.32;
    }
    return Scaffold(
      body: loading.value
          ? CustomLoadingWidget(color: AppColors.whiteColor)
          : errorMessage != null
          ? Center(
        child: Text(
          errorMessage ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      )
          : Stack(
        children: [
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: Transform.scale(
              scale: cameraAspectRatio / screenSize.aspectRatio,
              child: AspectRatio(
                aspectRatio: cameraAspectRatio,
                child: CameraPreview(
                  controller!,
                ),
              ),
            ),
          ),

          /// Close Button
          Positioned(
            top: 54,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigation.pop(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Icon(Icons.clear),
                ),
              ),
            ),
          ),

          /// Pick videos from gallery
          Positioned(
            bottom: 40,
            left: 16,
            child: GestureDetector(
              onTap: () {
                if (isRecordingOn.value == false) {
                  _profileController.pickVideosFromGallery();
                }
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isControllerInitialized.value
                    ? Icon(Icons.image_outlined)
                    : const CircularProgressIndicator(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 152,
            right: 152,
            child: AnimatedBuilder(
                animation: buttonAnimationController,
                builder: (context, child) {
                  double scaleValue = (0.5 * buttonAnimationController.value) + 1;
                  return Transform.scale(
                    scale: scaleValue,
                    child: RecordButton(
                      onLongPressStart: startRecording,
                      onLongPressUp: stopRecording,
                      onPlay: () {},
                      onStop: (value) {},
                      onComplete: (value) {
                        stopRecording();
                      },
                      fillColor: const Color(0xff5AC548),
                      seconds: 60,
                      height: 70,
                      width: 70,
                      labelColor: Colors.yellowAccent,
                      buttonColor: Colors.white,
                      trackColor: Colors.black38,
                    ),
                  );
                }),
          ),
          Positioned(
            bottom: 40,
            right: 16,
            child: GestureDetector(
              onTap: () async {
                log("-----------${controller?.value.isRecordingVideo}");
                if (controller?.value.isRecordingVideo == true) {
                  // controller = CameraController(
                  //   controller?.value.description == cameras[0] ? cameras[1] : cameras[0],
                  //   ResolutionPreset.high,
                  // );

                  await controller?.pauseVideoRecording();
                  await controller?.setDescription(controller?.value.description == cameras[0] ? cameras[1] : cameras[0]);
                  await controller?.resumeVideoRecording();
                } else {
                  controller?.setDescription(controller?.value.description == cameras[0] ? cameras[1] : cameras[0]);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 9),
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Icon(Icons.cameraswitch_sharp),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.85),
            child: Obx(() {
              if (showTimer.value == false) {
                return const SizedBox.shrink();
              }
              return const TimerClassWidget();
            }),
          )
        ],
      ),
    );
  }
}

class TimerClassWidget extends StatefulWidget {
  const TimerClassWidget({super.key});

  @override
  State<TimerClassWidget> createState() => _TimerClassWidgetState();
}

class _TimerClassWidgetState extends State<TimerClassWidget> {
  String recordingTime = '00:00';
  bool isRecording = false;
  Duration duration = const Duration(seconds: 0);

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void recordTime() async {
    await Future.delayed(const Duration(seconds: 1));
    duration = Duration(seconds: duration.inSeconds + 1);
    recordingTime = _printDuration(duration);
    if (mounted) {
      setState(() {});
    }
    recordTime();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recordTime();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.red.shade600,
            radius: 10,
          ),
          const SizedBox(width: 10),
          Text(
            recordingTime,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}