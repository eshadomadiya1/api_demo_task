// import 'dart:io';
//
// import 'package:flutter_template/modules/dashboad/feed/controller/feed_controller.dart';
// import 'package:flutter_template/modules/dashboad/feed/services/reel_service.dart';
// import 'package:http/http.dart' as http;
// import 'dart:developer';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_template/modules/authentication/models/verify_request_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/add_comment_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/comment_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/add_folder_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/get_folder_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/get_story_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/post_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/model/save_post_model.dart';
// import 'package:flutter_template/modules/dashboad/feed/services/feed_service.dart';
// import 'package:flutter_template/modules/profile/model/user_profile_model.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
// import '../../../../widget/bottomSheets/save_post_folder_bottomSheet.dart';
// import '../../setting/model/get_save_post_model.dart';
// import '../model/archive_story_model.dart';
// import '../model/get_reel_model.dart';
// import '../model/my_post_model.dart';
// import '../model/my_story_model.dart';
// import '../model/reel_model.dart';
//
// class ReelController extends GetxController {
//   RxBool isLoading = false.obs;
//   RxBool isCommentLoading = false.obs;
//   RxList<CommentData> commentDataList = <CommentData>[].obs;
//   final GlobalKey<FormState> folderKey = GlobalKey<FormState>();
//   RxBool isPageAvailable = false.obs;
//   RxInt currentPage = 1.obs;
//
//   final FeedController _feedController = Get.find();
//
//   Future<void> shareImageAndText({
//     required String img,
//     required String title,
//   }) async {
//     final url =Uri.parse(img);
//     http.Response response = await http.get(url);
//     final bytes = response.bodyBytes;
//
//     final temp =await getTemporaryDirectory();
//     final path = "${temp.path}/image.jpg";
//     File(path).writeAsBytesSync(bytes);
//
//     log(path);
//
//     await Share.shareXFiles(
//       [XFile(path)],
//       text: title,
//     );
//   }
//
//   void reelLikeStatus({required String reelId, required int index}) {
//     log("reel id :: $reelId");
//     log("index :: $index");
//     if (_feedController.reelsDataList[index].isLike) {
//       reelDislike(reelId: reelId);
//     } else {
//       reelLike(reelId: reelId);
//     }
//     _feedController.reelsDataList[index].isLike = !_feedController.reelsDataList[index].isLike;
//     log("reel like status--->${_feedController.reelsDataList[index].isLike}");
//     _feedController.reelsDataList.refresh();
//   }
//
//   ///reel like
//   Future<void> reelLike({required String reelId}) async {
//     try {
//       isLoading.value = true;
//       EmailVerifyResponse result = await ReelService.reelLike(reelId: reelId);
//       isLoading.value = false;
//       if (result.status == 200) {
//       }
//       isLoading.value = false;
//     } catch (e, st) {
//       log('reel Error $e :: st $st');
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   ///reel dislike
//   Future<void> reelDislike({required String reelId}) async {
//     try {
//       isLoading.value = true;
//       EmailVerifyResponse result =
//       await ReelService.reelDisLike(reelId: reelId);
//       isLoading.value = false;
//       if (result.status == 200) {}
//       isLoading.value = false;
//     } catch (e, st) {
//       log('reelDislike Error $e :: st $st');
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//
// /*  ///Get comment list
//     Future<void> getListOfComment({required String postId}) async {
//       try {
//         isCommentLoading.value = true;
//         commentDataList.clear();
//         CommentModel result = await FeedService.getCommentList(postId: postId);
//         isCommentLoading.value = false;
//         if (result.statusCode == 200) {
//           commentDataList.value = result.commendData;
//           log("comment data---->${postDataList.length}");
//         }
//         log('getListOfPost ${postDataList.length}');
//         isCommentLoading.value = false;
//       } catch (e, st) {
//         log('getListOfPost Error $e :: st $st');
//       } finally {
//         if (isCommentLoading.value) isCommentLoading.value = false;
//       }
//     }
//
//     ///Add comment
//     Future<void> addComment(
//         {required String postId, required String comment}) async {
//       isLoading.value = true;
//       try {
//         Comment result = Comment(
//           postId: postId,
//           comment: comment,
//         );
//         log("------------->$result");
//         AddCommentModel commentModel = await FeedService.addComment(result);
//         log("--->$result");
//         isLoading.value = false;
//         if (commentModel.statusCode == 200 || commentModel.statusCode == 201) {
//           getListOfComment(postId: postId);
//           //  Navigation.pushNamed(Routes.navBarScreen);
//         }
//         isLoading.value = false;
//       } catch (e, st) {
//         log("error :: $e  $st");
//       } finally {
//         if (isLoading.value) isLoading.value = false;
//       }
//     }*/
//
//
//
// }