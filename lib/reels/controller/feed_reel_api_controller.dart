// import 'dart:io';
//
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
//
// class FeedController extends GetxController {
//   RxBool isLoading = false.obs;
//   RxBool isPostSaveLoading = false.obs;
//   RxBool isPostLoading = false.obs;
//   RxBool isMyPostLoading = false.obs;
//   RxBool isReelLoading = false.obs;
//   RxBool isStoryLoading = false.obs;
//   RxBool isCommentLoading = false.obs;
//   RxBool isGetSavePostLoading = false.obs;
//   RxBool isFolderLoading = false.obs;
//   RxBool isAddFolderLoading = false.obs;
//   RxBool isViewProfileLoading = false.obs;
//   UserProfileModel? userProfileData;
//   RxBool isBookmarked = false.obs;
//   RxBool isFolderValidate = false.obs;
//   RxList<PostData> postDataList = <PostData>[].obs;
//   RxList<GetReelData> reelsDataList = <GetReelData>[].obs;
//   RxList<StoryData> storyDataList = <StoryData>[].obs;
//   RxList<MyStory> myStoryList = <MyStory>[].obs;
//   RxList<MyPOst> myPostList = <MyPOst>[].obs;
//   RxList<SavePostData> savePostDataList = <SavePostData>[].obs;
//   RxList<ArchiveMyStory> archiveStoryList = <ArchiveMyStory>[].obs;
//   RxList<CommentData> commentDataList = <CommentData>[].obs;
//   RxList<Myfolder> folderList = <Myfolder>[].obs;
//   Map<String, dynamic> parsedJson = {};
//   Map<String, dynamic> savePostData = {};
//   TextEditingController txtComment = TextEditingController();
//   TextEditingController txtFolderName = TextEditingController();
//   final GlobalKey<FormState> folderKey = GlobalKey<FormState>();
//   RxBool isPageAvailable = false.obs;
//   RxInt currentPage = 1.obs;
//
//   //for pagination
//   RxInt pageNo = 1.obs;
//   RxInt numberOfPage = 1.obs;
//
//   /*@override
//   void onInit() {
//     super.onInit();
//     getListOfPost(page: 1, limit: 50);
//   }*/
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
//
//     File(path).writeAsBytesSync(bytes);
//
//     log(path);
//     log("title--->$title");
//
//     // await Share.share(title);
//     await Share.shareXFiles(
//       [XFile(path)],
//       text: title,
//     );
//   }
//
//   Future<void> shareText ({
//
//     required String title,
//   }) async {
//
//     await Share.share(
//       title,
//     );
//   }
//
//   void toggleLikeStatus({required String postId, required int index}) {
//     log("post id :: $postId");
//     log("index :: $index");
//     if (postDataList[index].isLike) {
//
//       addPostDislike(postId: postId);
//     } else {
//       addPostLike(postId: postId);
//     }
//     postDataList[index].isLike = !postDataList[index].isLike;
//     log("post like status--->${postDataList[index].isLike}");
//     postDataList.refresh();
//   }
//
//
//   void toggleBookmarkStatus({required String postId,
//     required int index,
//     required BuildContext context}) {
//     if (!postDataList[index].isSave) {
//       getFolders();
//       postSave(
//         postId: postId,
//         folder: "",
//       );
//       showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (BuildContext context) {
//           return SavePostFolderBottomSheet(
//             postId: postId,
//             postIndex: index,
//             image: postDataList[index].postImage,
//           );
//         },
//       );
//       // postDataList[index].isSave = !postDataList[index].isSave;
//       //postSave(postId: postId,folder: "");
//     } else {
//       postUnSave(postId: postId);
//
//       log("--->post unSave");
//     }
//     postDataList[index].isSave = !postDataList[index].isSave;
//     postDataList.refresh();
//   }
//
//   ///Get story list
//   Future<void> getListOfStory() async {
//     log("totalCount :: ${pageNo.value}");
//     if(storyDataList.isEmpty){
//       log("asdasdasd::::::${storyDataList.length}");
//       isStoryLoading.value = true;
//     }
//     try {
//       // storyDataList.clear();
//       GetStoryModel result =
//       await FeedService.getStoryList(page: pageNo.value, limit: 10);
//       if (result.statusCode == 200) {
//         /*if(result.storyData!.isNotEmpty){
//           for(var storyData in result.storyData!){
//             storyDataList.add(storyData);
//           }
//           log("--->$storyDataList");
//         }*/
//         storyDataList.value = result.storyData!;
//
//         log("story data---->${storyDataList.length}");
//       }
//       if (kDebugMode) {
//         print('getListOfStory ${storyDataList.length}');
//       }
//       isStoryLoading.value = false;
//     } catch (e, st) {
//       log('getListOfPost Error $e :: st $st');
//     } finally {
//       if (isStoryLoading.value) isStoryLoading.value = false;
//     }
//   }
//
//   ///Get my story
//   Future<void> getMyStory() async {
//     if(myStoryList.isEmpty){
//       // isStoryLoading.value = true;
//     }
//     try {
//       MyStoryModel result = await FeedService.getMyStoryList();
//       isStoryLoading.value = false;
//       if (result.statusCode == 200) {
//
//         myStoryList.value = result.myStory!;
//         log("my story data---->${postDataList.length}");
//       }
//       if (kDebugMode) {
//         print('getListOfMyStory ${postDataList.length}');
//       }
//       isStoryLoading.value = false;
//     } catch (e, st) {
//       log('getListOfMyStory Error $e :: st $st');
//     } finally {
//       if (isStoryLoading.value) isStoryLoading.value = false;
//     }
//   }
//
//
//
//   int postPageNo=1;
//   bool postMoreAvailable=true;
//   RxBool postapiCall=true.obs;
//
//   ///Get post list
//   Future<void> getListOfPost({bool isFirst=true}) async {
//     if(postDataList.isEmpty){
//       isPostLoading.value = true;
//     }
//     if(isFirst){
//       postPageNo=1;
//       postMoreAvailable=true;
//     }
//     if(!postMoreAvailable){
//       return;
//     }
//
//     try {
//       log("totalCount POST:: ${postPageNo}");
//
//       PostModel result =
//       await FeedService.getPostList(page: postPageNo, limit: 10);
//       isPostLoading.value = false;
//       if (result.statusCode == 200 && result.postData.isNotEmpty) {
//         if (result.postData.isNotEmpty) {
//           //numberOfPage.value = result.totalPages!;
//           if(isFirst){
//             postDataList.value=result.postData;
//           }else{
//
//             postDataList.addAll(result.postData);
//           }
//           if(result.postData.length<10){
//             postMoreAvailable=false;
//           }
//           postPageNo++;
//           /// 4 line comment
//           // for (var postData in result.postData) {
//           //   postDataList.add(postData);
//           //   log("Number Of Page--->${numberOfPage.value}");
//           // }
//         }
//         //postDataList.value = result.postData;
//         log("post data---->${postDataList.length}");
//       }
//       log('get List OfPost ${postDataList.length}');
//       isPostLoading.value = false;
//     } catch (e, st) {
//       log('getListOfPost Error $e :: st $st');
//     } finally {
//       postapiCall.value=false;
//       if (isPostLoading.value) isPostLoading.value = false;
//     }
//   }
//
//   Future<void> getListOfPostMoreData() async {
//     try {
//       if (kDebugMode) {
//         print('currentPage load more $currentPage');
//       }
//       isPageAvailable.value = true;
//       PostModel result =
//       await FeedService.getPostList(page: currentPage.value, limit: 10);
//       if (result.postData.isNotEmpty) {
//         for (var postData in result.postData) {
//           postDataList.add(postData);
//         }
//         currentPage.value++;
//         update();
//       }
//       if (kDebugMode) {
//         print(
//             'getUserNotificationMoreData notificationList ${postDataList
//                 .length}');
//       }
//       isPageAvailable.value = false;
//     } catch (e, st) {
//       debugPrint('getUserNotificationMoreData Error $e :: st $st');
//     } finally {
//       if (isPageAvailable.value) isPageAvailable.value = false;
//     }
//   }
//
//   ///Get reel list
//   Future<void> getListOfReels() async {
//     if(reelsDataList.isEmpty){
//
//       isReelLoading.value = true;
//     }
//     try {
//       // reelsDataList.clear();
//       GetReelModel result =
//       await FeedService.getReelList(page: pageNo.value, limit: 10);
//       isReelLoading.value = false;
//       if (result.statusCode == 200 && result.reelData!.isNotEmpty) {
//         if (result.reelData != null) {
//           numberOfPage.value = result.totalPages!;
//           reelsDataList.value=result.reelData??[];
//
//           /// 5 line comment
//           // for (var reelData in result.reelData!) {
//           //   reelsDataList.add(reelData);
//           //   log("reels data---->${postDataList.length}");
//           //   log("Number Of Page--->${numberOfPage.value}");
//           // }
//           ///
//           // Navigation.pushNamed(Routes.reelsScreen);
//         }
//       }
//       log('get List Of Reels ${postDataList.length}');
//       isReelLoading.value = false;
//     } catch (e, st) {
//       log('getListOfReels Error $e :: st $st');
//     } finally {
//       if (isReelLoading.value) isReelLoading.value = false;
//     }
//   }
//
//   ///Get comment list
//   Future<void> getListOfComment({required String postId,bool loading=true}) async {
//     try {
//       if(loading){
//         isCommentLoading.value = true;
//       }
//       // commentDataList.clear();
//       CommentModel result = await FeedService.getCommentList(postId: postId);
//       if (result.statusCode == 200) {
//         commentDataList.value = result.commendData;
//         log("comment data---->${postDataList.length}");
//       }
//       log('getListOfPost ${postDataList.length}');
//       isCommentLoading.value = false;
//     } catch (e, st) {
//       log('getListOfPost Error $e :: st $st');
//     } finally {
//       if (isCommentLoading.value) isCommentLoading.value = false;
//     }
//   }
//
//   ///Add comment
//   Future<void> addComment(
//       {required String postId, required String comment}) async {
//     isLoading.value = true;
//     try {
//       Comment result = Comment(
//         postId: postId,
//         comment: comment,
//       );
//       log("------------->$result");
//       AddCommentModel commentModel = await FeedService.addComment(result);
//       log("--->$result");
//       isLoading.value = false;
//       if (commentModel.statusCode == 200 || commentModel.statusCode == 201) {
//         getListOfComment(postId: postId,loading: false);
//         //  Navigation.pushNamed(Routes.navBarScreen);
//       }
//       isLoading.value = false;
//     } catch (e, st) {
//       log("error :: $e  $st");
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   ///Post like
//   Future<void> addPostLike({required String postId}) async {
//     try {
//       // isLoading.value = true;
//       EmailVerifyResponse result = await FeedService.postLike(postId: postId);
//       isLoading.value = false;
//       if (result.status == 200) {}
//       isLoading.value = false;
//     } catch (e, st) {
//       log('addPostLike Error $e :: st $st');
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   ///Post dislike
//   Future<void> addPostDislike({required String postId}) async {
//     try {
//       // isLoading.value = true;
//       EmailVerifyResponse result =
//       await FeedService.postDisLike(postId: postId);
//       isLoading.value = false;
//       if (result.status == 200) {}
//       isLoading.value = false;
//     } catch (e, st) {
//       log('addPostDislike Error $e :: st $st');
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   ///get my post
//   Future<void> getMyPost() async {
//     log("totalCount :: ${pageNo.value}");
//     if( myPostList.isEmpty){
//       isMyPostLoading.value = true;
//     }
//
//     try {
//       MyPost result = await FeedService.getMyPost();
//       // isMyPostLoading.value = false;
//       if (result.statusCode == 200) {
//         if (result.myPOst!.isNotEmpty) {
//           myPostList.value = result.myPOst!;
//         }
//         //postDataList.value = result.postData;
//         log("my post data---->${myPostList.length}");
//       }
//       log('get List Of my Post ${myPostList.length}');
//       isMyPostLoading.value = false;
//     } catch (e, st) {
//       log('getListOfMyPost Error $e :: st $st');
//     } finally {
//       if (isMyPostLoading.value) isMyPostLoading.value = false;
//     }
//   }
//
//   ///archive my story
//   Future<void> archiveMyStory() async {
//     if(archiveStoryList.isEmpty){
//       isStoryLoading.value = true;
//     }
//     try {
//       ArchiveStoryModel result = await FeedService.archiveMyStory();
//       isMyPostLoading.value = false;
//       if (result.statusCode == 200) {
//         if (result.myStory!.isNotEmpty) {
//           archiveStoryList.value = result.myStory!;
//         }
//         //postDataList.value = result.postData;
//         log("my post data---->${myPostList.length}");
//       }
//       log('get List Of my Post ${myPostList.length}');
//       isMyPostLoading.value = false;
//     } catch (e, st) {
//       log('getListOfMyPost Error $e :: st $st');
//     } finally {
//       if (isMyPostLoading.value) isMyPostLoading.value = false;
//     }
//   }
//
//   ///Post save
//   Future<void> postSave(
//       {required String postId, required String folder}) async {
//     try {
//       isPostSaveLoading.value = true;
//       AddData result = AddData(postId: postId, folder: folder);
//       SavePostModel savePostModel = await FeedService.savePost(
//           request: result);
//       isPostSaveLoading.value = false;
//       if (savePostModel.statusCode == 200) {
//         log('postSave ${savePostModel.statusCode} ${savePostModel.message}');
//       }
//       isPostSaveLoading.value = false;
//     } catch (e, st) {
//       log('postSave Error $e :: st $st');
//     } finally {
//       if (isPostSaveLoading.value) isPostSaveLoading.value = false;
//     }
//   }
//
//   /*   ///getSavePost
//     Future<void> getSavePost1() async {
//       isGetSavePostLoading.value = true;
//       try {
//         String result = await FeedService.getSavePostList();
//         parsedJson = json.decode(result);
//         isGetSavePostLoading.value = false;
//
//         log('get List OfPost ${postDataList.length}');
//         isGetSavePostLoading.value = false;
//       } catch (e, st) {
//         log('getListOfPost Error $e :: st $st');
//       } finally {
//         if (isGetSavePostLoading.value) isGetSavePostLoading.value = false;
//       }
//     }*/
//
//
//   ///get my post
//   Future<void> getSavePost() async {
//     if(ConstDatas.savePostLoading){
//       isGetSavePostLoading.value = true;
//     }
//     try {
//       GetSavePostModel result = await FeedService.getSavePostList();
//       isGetSavePostLoading.value = false;
//       if (result.statusCode == 200) {
//         if (result.savePostData != null) {
//           savePostDataList.value = result.savePostData!;
//         }
//         log("getSavePost---->${savePostDataList.length}");
//       }
//       log('getSavePost ${myPostList.length}');
//       isMyPostLoading.value = false;
//     } catch (e, st) {
//       log('getSavePost Error $e :: st $st');
//     } finally {
//       ConstDatas.savePostLoading=false;
//       if (isMyPostLoading.value) isMyPostLoading.value = false;
//     }
//   }
//
//   ///Post unSave
//   Future<void> postUnSave({required String postId}) async {
//     try {
//       // isLoading.value = true;
//       EmailVerifyResponse result = await FeedService.postUnSave(
//           postId: postId);
//       isLoading.value = false;
//       if (result.status == 200) {
//         getSavePost();
//       }
//       isLoading.value = false;
//     } catch (e, st) {
//       log('post UnSave Error $e :: st $st');
//     } finally {
//       if (isLoading.value) isLoading.value = false;
//     }
//   }
//
//   ///Add folder name
//   Future<void> addFolderName({required String folderName}) async {
//     if (folderKey.currentState?.validate() ?? false) {
//       try {
//         isAddFolderLoading.value = true;
//         FolderModel result =
//         await FeedService.addFolder(folderName: folderName.trim());
//         isAddFolderLoading.value = false;
//         if (result.statusCode == 200) {
//           Get.back();
//           getFolders();
//         }
//         txtFolderName.clear();
//         isAddFolderLoading.value = false;
//       } catch (e, st) {
//         log('addPostLike Error $e :: st $st');
//       } finally {
//         if (isAddFolderLoading.value) isAddFolderLoading.value = false;
//       }
//     }
//   }
//
//   ///Get folder name
//   Future<void> getFolders() async {
//     try {
//       if(folderList.isEmpty){
//
//         isFolderLoading.value = true;
//       }
//       GetFolderModel result = await FeedService.getFolderList();
//       isFolderLoading.value = false;
//       if (result.statusCode == 200) {
//         log("Get my folder list ------>${result.myfolder}");
//         folderList.value = result.myfolder!;
//         log("folder list ------>${folderList.length}");
//       }
//       log('get folder ${folderList.length}');
//       isFolderLoading.value = false;
//     } catch (e, st) {
//       log('get folder Error $e :: st $st');
//     } finally {
//       if (isFolderLoading.value) isFolderLoading.value = false;
//     }
//   }
//
//   ///view profile
//   Future<UserProfileModel?> viewProfileData({required String userId}) async {
//     try {
//       isViewProfileLoading.value = true;
//       userProfileData = await FeedService.viewUserProfile(userId: userId);
//       log("User Profile status code : ${userProfileData?.statusCode}");
//       if (userProfileData?.statusCode == 200) {
//         if (userProfileData != null) {
//           isViewProfileLoading.value = false;
//         }
//       }
//     } catch (e, st) {
//       log("Error fetching user profile data: $e $st");
//       isViewProfileLoading.value = false;
//     } finally {
//       if (isViewProfileLoading.value) isViewProfileLoading.value = false;
//     }
//
//     return null;
//   }
//
// /* RxList<StoryModel> storyList = [
//     StoryModel(
//         img: "assets/temp/p2.jpeg",
//         name: "Dad",
//         isDad: true,
//         storyList: [
//           StoryItem(
//             sContent:
//             "https://wallpapers.com/images/hd/beach-sunset-on-awesome-phone-9ntm03cwji8tmu3r.jpg",
//             isImage: true,
//           )
//         ]),
//     StoryModel(
//         img: "assets/temp/w1.jpeg",
//         name: "Mum",
//         isDad: false,
//         storyList: [
//           StoryItem(
//             sContent:
//             "https://assets.mixkit.co/videos/preview/mixkit-countryside-meadow-4075-large.mp4",
//             isImage: true,
//           )
//         ]),
//     StoryModel(
//         img: "assets/temp/p2.jpg",
//         name: "michael",
//         isDad: true,
//         storyList: [
//           StoryItem(
//             sContent:
//             "https://e1.pxfuel.com/desktop-wallpaper/359/309/desktop-wallpaper-dark-android-full-full-screen-aesthetic.jpg",
//             isImage: true,
//           )
//         ]),
//     StoryModel(
//         img: "assets/temp/w2.webp",
//         name: "sonya",
//         isDad: false,
//         storyList: [
//           StoryItem(
//             sContent:
//             "https://wallpapers.com/images/hd/beach-sunset-on-awesome-phone-9ntm03cwji8tmu3r.jpg",
//             isImage: true,
//           )
//         ]),
//   ].obs;*/
// }
//
// class ConstDatas{
//
//   static bool savePostLoading=true;
//   static bool isDashboad=false; // for deshboard to edit time redirect to use
// }