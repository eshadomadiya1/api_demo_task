import 'dart:developer';
import 'dart:io';
import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/utils/app_preferences.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:api_demo_task/widget/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CreatedVideoPlayScreen extends StatefulWidget {
  const CreatedVideoPlayScreen({super.key});

  @override
  State<CreatedVideoPlayScreen> createState() => _CreatedVideoPlayScreenState();
}

class _CreatedVideoPlayScreenState extends State<CreatedVideoPlayScreen> {
  VideoPlayerController? videoPlayerController;
  RxBool loadingVideo = false.obs;
  String videoPath = '';

  RxBool showButton = true.obs;

  void uploadReel() async {
    // log("--------------1");
    // showButton.value = false;
    // log("--------------2");
    // try {
    //   LogUtils.debugLog('videoPath :: ${videoPath}');
    //   String result = await Api().multiPartApi(
    //     api: ApiConstants.createReel,
    //     imageKey: 'file',
    //     image: XFile(videoPath),
    //     bodyData: {},
    //   );
    //   log("--------------$result");
    // } catch (e) {
    //   log("[][]]][]$e");
    // }
    //
    // showButton.value = true;
    // videoPlayerController?.dispose();
    // Navigation.replaceAll(Routes.homeScreen);
    // await Future.delayed(const Duration(microseconds: 100));
    Navigation.pushNamed(Routes.createReels);
  }

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      videoPath = Get.arguments;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await playRecordedVideo();
    });
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> playRecordedVideo() async {
    if (videoPath.isEmpty) {
      log('playRecordedVideo inside if');
      return;
    }
    log('playRecordedVideo :: VIDEO PATH :: $videoPath');
    videoPlayerController = VideoPlayerController.file(File(videoPath));
    try {
      loadingVideo.value = true;
      await videoPlayerController?.initialize();
      await videoPlayerController?.play();
      await videoPlayerController?.setLooping(true);
      loadingVideo.value = false;
    } catch (e, st) {
      log('PLAY RECORDED VIDEO ERROR :: $e :: ST $st');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(
              () => loadingVideo.value
              ? CustomLoadingWidget(color: AppColors.whiteColor)
              : SingleChildScrollView(
            child: Column(
              children: [
                if (videoPlayerController != null && videoPlayerController!.value.isInitialized)
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 0.8, // Adjust the height as needed
                    child: Stack(
                      children: [
                        VideoPlayer(videoPlayerController!),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF000000).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                GestureDetector(
                  onTap: () {
                    uploadReel();
                  },
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(46),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 11, horizontal: 24),
                      child: Obx(() {
                        if (showButton.value == false) {
                          return const CircularProgressIndicator();
                        }
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              // backgroundImage: NetworkImage(
                              //   AppPreference.getString("profile_image_link"),
                              // ),
                            ),
                            CommonText(
                              text: "video",
                              fontSize: 20,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                            ).paddingOnly(left: 8),
                          ],
                        );
                      }),
                    ),
                  ).paddingSymmetric(vertical: 32),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
