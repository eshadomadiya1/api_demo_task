// import 'dart:developer';
// import 'package:api_demo_task/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_template/modules/dashboad/feed/controller/feed_controller.dart';
// import 'package:flutter_template/modules/dashboad/feed/controller/reel_controller.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/get_reel_model.dart';
// import 'package:flutter_template/utils/app_colors.dart';
// import 'package:flutter_template/utils/assets.dart';
// import 'package:flutter_template/utils/navigation_utils/navigation.dart';
// import 'package:get/get.dart';
// import 'package:preload_page_view/preload_page_view.dart';
// import 'package:video_player/video_player.dart';
// import 'package:visibility_detector/visibility_detector.dart';
// import '../../../../../widget/app_image.dart';
// import '../../model/reel_model.dart';
//
// class ReelsPage extends StatefulWidget {
//   final GetReelData? item;
//   final int position;
//
//   //final Function(ReelDetail? reelDetail)? onLike;
//   final Function(GetReelData? reelDetail)? onComment;
//   final PreloadPageController swiperController;
//
//   const ReelsPage({
//     Key? key,
//     required this.item,
//     this.onComment,
//     //this.onLike,
//     required this.swiperController,
//     required this.position,
//   }) : super(key: key);
//
//   @override
//   State<ReelsPage> createState() => _ReelsPageState();
// }
//
// class _ReelsPageState extends State<ReelsPage> {
//   late VideoPlayerController _videoPlayerController;
//
//   final ReelController _reelController = Get.put(ReelController());
//
//   @override
//   void initState() {
//     initializePlayer();
//     super.initState();
//   }
//
//   Future initializePlayer() async {
//     try {
//       _videoPlayerController =
//       VideoPlayerController.networkUrl(Uri.parse(widget.item?.reel ?? ""))
//         ..setLooping(true);
//       await Future.wait([_videoPlayerController.initialize()]);
//       setState(() {});
//     } catch (error) {
//       log("LOAD VIDEO ERROR $error");
//     }
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.pause();
//     Future.delayed(const Duration(milliseconds: 500))
//         .then((value) => _videoPlayerController.dispose());
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return getVideoView();
//   }
//
//   Widget getVideoView() {
//     return Scaffold(
//       backgroundColor: AppColors.black,
//       body: VisibilityDetector(
//         onVisibilityChanged: (VisibilityInfo info) async {
//           if (info.visibleFraction < 0.5) {
//             await _videoPlayerController.pause();
//           } else {
//             await _videoPlayerController.play();
//           }
//         },
//         key: Key("${DateTime.now().millisecondsSinceEpoch}"),
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             _videoPlayerController.value.isInitialized
//                 ? Positioned.fill(
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 clipBehavior: Clip.hardEdge,
//                 child: SizedBox(
//                   height: _videoPlayerController.value.size.height,
//                   width: _videoPlayerController.value.size.width,
//                   // color: AppColors.backGroundColor,
//                   child: VideoPlayer(_videoPlayerController),
//                 ),
//               ),
//             )
//                 : const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 10),
//                 Text('Loading...')
//               ],
//             ),
//             Positioned(
//               left: 3.w,
//               top: 30.h,
//               child: IconButton(
//                 icon: Image.asset(
//                   IconAsset.leftArrow,
//                   color: AppColors.white,
//                   width: 25.w,
//                 ),
//                 onPressed: () {
//                   Navigation.pop();
//                 },
//               ),
//             ),
//             Positioned(
//               right: -1.w,
//               bottom: 70.h,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       log("---> isLike ${widget.item?.isLike}");
//                       _reelController.reelLikeStatus(
//                         reelId: "${widget.item?.sId}",
//                         index: widget.position,
//                       );
//                       setState(() {});
//                     },
//                     child: widget.item?.isLike == true
//                         ? Image.asset(
//                       IconAsset.fillHeart,
//                       width: 28.w,
//                       height: 28.h,
//                     )
//                         : Image.asset(
//                       IconAsset.heart,
//                       color: AppColors.white,
//                       width: 28.w,
//                       height: 28.h,
//                     ),
//                     /*widget.item?.isLike == true
//                         ? Image.asset(
//                             IconAsset.fillHeart,
//                             width: 28.w,
//                             height: 28.h,
//                           )
//                         : Image.asset(
//                             IconAsset.heart,
//                             width: 28.w,
//                             height: 28.h,
//                             color: AppColors.white,
//                           ),*/
//                   ),
//                   Text(
//                     "Likes",
//                     style: TextStyle(color: AppColors.white, fontSize: 13.sp),
//                   ).paddingSymmetric(vertical: 10.h),
//                   ///
//                   GestureDetector(
//                     onTap: () {
//                       Get.find<FeedController>().shareText(  title: "${widget.item?.name??" "}\n${widget.item?.profileImage??""}");
//                     },
//                     child: Image.asset(
//                       IconAsset.send,
//                       width: 30.w,
//                       height: 30.h,
//                       color: AppColors.white,
//                     ).paddingOnly(top: 20.h),
//                   ),
//                   Text(
//                     "Share",
//                     style: TextStyle(color: AppColors.white, fontSize: 13.sp),
//                   ).paddingSymmetric(vertical: 10.h),
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     /* showModalBottomSheet(
//                   //     context: context,
//                   //     isScrollControlled: true,
//                   //     builder: (BuildContext context) {
//                   //       return CommentBottomSheet(
//                   //         postId: postData.id,
//                   //       );
//                   //     },
//                   //   );
//                   //   _feedController.getListOfComment(
//                   //     postId: postData.id,
//                   //   );*/
//                   //   },
//                   //   child: Image.asset(
//                   //     IconAsset.comment,
//                   //     width: 30.w,
//                   //     height: 30.h,
//                   //     color: AppColors.white,
//                   //   ).paddingOnly(top: 20.h),
//                   // ),
//                   // Text(
//                   //   "Comment",
//                   //   style: TextStyle(color: AppColors.white, fontSize: 13.sp),
//                   // ).paddingSymmetric(vertical: 10.h),
//
//                   ///
//                 ],
//               ).paddingOnly(right: 10.w),
//             ),
//             Positioned(
//               bottom: 25.h,
//               left: 10.w,
//               child: _buildUserImageName(context: context).paddingSymmetric(
//                 horizontal: 15.w,
//                 vertical: 4.h,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildUserImageName({required BuildContext context}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: Container(
//                 height: 40.h,
//                 width: 40.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100.r),
//                   border: Border.all(
//                     /* color: feedData["isDad"] == true
//                         ? AppColors.dadColor
//                         : AppColors.momColor,*/
//                     color: AppColors.momColor,
//                     width: 1.5.w,
//                   ),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100.r),
//                   child: widget.item?.profileImage != null
//                       ? AppImage(
//                     url: "${widget.item?.profileImage}",
//                     width: ScreenUtil().screenWidth,
//                   )
//                       : Image.asset(
//                     ImagesAsset.userPlaceholder,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               "${widget.item?.name}",
//               style: TextStyle(
//                 color: AppColors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 15.sp,
//               ),
//             ).paddingOnly(
//               left: (10.w),
//             ),
//           ],
//         ),
//         if (widget.item?.caption != null)
//           Text(
//             "${widget.item?.caption}",
//             style: TextStyle(
//               fontSize: 14.8.sp,
//               color: AppColors.white,
//               fontWeight: FontWeight.w500,
//             ),
//           ).paddingOnly(top: 10.h),
//       ],
//     );
//   }
// }