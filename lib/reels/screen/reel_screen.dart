// import 'dart:developer';
//
// import 'package:api_demo_task/reels/screen/reels_viwer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_template/modules/dashboad/feed/controller/feed_controller.dart';
// import 'package:flutter_template/modules/dashboad/feed/presentation/reels/reels_viewer.dart';
// import 'package:flutter_template/utils/app_colors.dart';
// import 'package:flutter_template/widget/custom_loading_widget.dart';
// import 'package:get/get.dart';
//
// import '../../utils/app_colors.dart';
// import '../../widget/custom_loading_widget.dart';
//
// class ReelsScreen extends StatelessWidget {
//   ReelsScreen({super.key});
//
//   // final FeedController _feedController = Get.find();
//
//   final currentReelIndex=Get.arguments;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//             () => _feedController.isReelLoading.value
//             ? CustomLoadingWidget(
//           color: AppColors.greyColor,
//         )
//             :
//             ReelsViewer(
//           reelIndex: currentReelIndex,
//           // reelsList: _feedController.reelsDataList,
//           /*  onLike: (ReelDetail? reelDetail) async {
//             print("reelDetail?.isLike ?? false ${reelDetail?.isLike ?? false}");
//             await _homeScreenController.doLikeReel(isLike: !(reelDetail?.isLike ?? false), reelId: reelDetail?.id ?? 0);
//             log('like on reel ==> ${reelDetail?.toJson()}');
//           },
//           onComment: (ReelData? reelData) {
//             Navigator.of(context).push(
//               PageRouteBuilder(
//                 opaque: false,
//                 settings: const RouteSettings(name: Routes.commentScreen),
//                 pageBuilder: (_, __, ___) => CommentScreen(
//                   commentList: reelData?.comments,
//                   commentOnTAp: (value) {
//                     if (value.isNotEmpty) {
//                       _homeScreenController.doCommentReel(comment: value, reelId: reelData?.reelDetail?.id ?? 0);
//                     }
//                   },
//                 ),
//               ),
//             );
//             log('Comment on reel ==> ');
//           },*/
//           // onIndexChanged: (index) {
//           //   log('======> Current Index ======> $index <========');
//           // },
//           onCall: () {
//             log('Call on reel ==> ');
//           },
//
//         ),
//       ),
//     );
//   }
// }