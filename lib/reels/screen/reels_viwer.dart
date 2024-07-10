// import 'package:api_demo_task/reels/screen/reels_page.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_template/modules/dashboad/feed/controller/feed_controller.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/get_reel_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/reel_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/presentation/reels/reels_page.dart';
// import 'package:get/get.dart';
// import 'package:preload_page_view/preload_page_view.dart';
//
// class ReelsViewer extends StatefulWidget {
//   /// use reel model and provide list of reels, list contains reels object, object contains url and other parameters
//   // final List<GetReelData>? reelsList;
//
//   /// use to show/hide verified tick, by default true
//   final bool showVerifiedTick;
//
//   /// function invoke when user click on share btn
//   final Function(GetReelData ? reelDetail)? onChat;
//
//   /// function invoke when user click on like btn
//   final Function(GetReelData? reelDetail)? onLike;
//
//   /// function invoke when user click on comment btn
//   final Function(GetReelData? reelDetail)? onComment;
//
//   /// function invoke when user click on call btn
//   final VoidCallback? onCall;
//
//   /// function invoke when reel change and return current index
//   final Function(int)? onIndexChanged;
//
//   /// for change appbar title
//   final String? appbarTitle;
//
//   /// for show/hide appbar, by default true
//   final bool showAppbar;
//
//   /// for show/hide video progress indicator, by default true
//   final bool showProgressIndicator;
//
//   final GestureTapCallback? onDoubleTap;
//
//   /// function invoke when user click on back btn
//   /// current reel index
//   final int reelIndex;
//   const ReelsViewer({
//     Key? key,
//     //  required this.reelsList,
//     this.showVerifiedTick = true,
//     this.onComment,
//     this.onChat,
//     this.onLike,
//     this.appbarTitle,
//     this.showAppbar = true,
//     this.onIndexChanged,
//     this.onCall,
//     required this.reelIndex,
//     this.onDoubleTap,
//     this.showProgressIndicator = true,
//   }) : super(key: key);
//
//   @override
//   State<ReelsViewer> createState() => _ReelsViewerState();
// }
//
// class _ReelsViewerState extends State<ReelsViewer> {
//   final PreloadPageController controller = PreloadPageController(initialPage: 0);
//   final FeedController _feedController = Get.find();
//
//   @override
//   void initState() {
//     // controller.addListener(() {
//     //   if (controller.position.pixels == controller.position.maxScrollExtent) {
//     //     homeScreenController.doGetMoreReel();
//     //   }
//     // });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//       ),
//       child: Scaffold(
//         body: Stack(
//           fit: StackFit.loose,
//           children: [
//             //We need swiper for every content
//             PreloadPageView.builder(
//               preloadPagesCount: 5,
//               itemCount:_feedController.reelsDataList.length-widget.reelIndex,
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int position) {
//                 return GestureDetector(
//                   onDoubleTap: () async {
//                     /*print("reelDetail?.isLike ?? false onDoubleTap ${widget.reelsList?[position].reelDetail?.isLike ?? false}");
//                     await Get.find<HomeScreenController>().doLikeReel(
//                         isLike: !(widget.reelsList?[position].reelDetail?.isLike ?? false), reelId: widget.reelsList?[position].reelDetail?.id ?? 0);
//                     log('like on reel onDoubleTap ==> ${widget.reelsList?[position].reelDetail?.toJson()}');*/
//                   },
//                   child: ReelsPage(
//                     position: position+widget.reelIndex,
//                     item: _feedController.reelsDataList[widget.reelIndex+position],
//                     onComment: widget.onComment,
//                     /* onLike: widget.onLike,
//                     onChat: widget.onChat,*/
//                     swiperController: controller,
//                   ),
//                 );
//               },
//               controller: controller,
//               onPageChanged: (int position) {
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }