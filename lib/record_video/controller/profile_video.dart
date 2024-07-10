import 'dart:convert';
import 'dart:io';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/utils/enums.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  RxBool isValid = false.obs;
  DateTime selectedDates = DateTime.now();
  RxBool showLoader = true.obs;
  RxBool showPaginationLoader = true.obs;

  // RxList<Visions> vision = <Visions>[].obs;
  //
  // AllReelsModel? allReelsModel;
  // Rx<RegisterResponseModel> getUserData = RegisterResponseModel().obs;
  // UserReelsModel? userReelsModel;
  RxBool showGridOfReels = false.obs;
  RxString networkImage = ''.obs;

  int pageNumber = 1;
  int pageSize = 15;
  static Map<String, dynamic> thumbnails = {};

  /// TextEditingController ==>
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final birthDateController = TextEditingController();
  final locationController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final careerController = TextEditingController();
  final whoYouAreController = TextEditingController();
  final yesOrNoController = TextEditingController();
  final personalMantraController = TextEditingController();

  ExpansionTileController expansionTileController = ExpansionTileController();

  RxString dropdownValue = "Yes".obs;
  // Rx<Country> selectedCountry = countryList.firstWhere((element) => element.name == "India").obs;

  /// date selection variable ==>
  RxString selectedDate = ''.obs;
  DateTime selectedBirth = DateTime.now();

  ScrollController scrollController = ScrollController();

  // void setUpdateUserData() {
  //
  //   final RegisterResponseModel? userData = AppPreference.getModelData();
  //
  //   nameController.text = userData?.apiresponse?.data?.name?? "";
  //   emailController.text = userData?.apiresponse?.data?.email?? "";
  //   genderController.text = userData?.apiresponse?.data?.gender?? "";
  //   birthDateController.text = DateFormat('MM/dd/yy').format(selectedDates);
  //   locationController.text = userData?.apiresponse?.data?.location?? "";
  //   phoneNumberController.text = userData?.apiresponse?.data?.mobileNo?? "";
  //   careerController.text = userData?.apiresponse?.data?.currentOccupation?? "";
  //   whoYouAreController.text = userData?.apiresponse?.data?.whoAmI?? "";
  //   yesOrNoController.text = userData?.apiresponse?.data?.areYouInterestedInMentorship?? "";
  //   selectedGender.value = (userData?.apiresponse?.data?.gender?? "")==GenderChange.male.name?GenderChange.male:GenderChange.female;
  //   pickedImage.value = userData?.apiresponse?.data?.profilePicture?? "";
  //
  // }

  /// profileEdit api
  // RegisterResponseModel? registerResponseModel;
  // RxBool isLoading = false.obs;
  //
  // Future<void> profileEditData() async {
  //   try {
  //     isLoading.value = true;
  //     RegisterRawDataModel registerRowModel = RegisterRawDataModel(
  //       name: nameController.text,
  //       email: emailController.text,
  //       gender: selectedGender.value.name,
  //       profilePicture: pickedFile,
  //       mobile: phoneNumberController.text,
  //       location: locationController.text,
  //       birthDate: selectedBirth.millisecondsSinceEpoch.toString(),
  //       currentOccupation: careerController.text,
  //       whoAmI: whoYouAreController.text,
  //       personalMantra: personalMantraController.text,
  //       areYouInterestedInMentorship: dropdownValue.value,
  //       countryCode: selectedCountry.value.phoneDetail.code,
  //     );
  //     LogUtils.debugLog('registerRowModel :: $registerRowModel');
  //     LogUtils.debugLog('selectedCountry.value.phoneDetail.code :: ${selectedCountry.value.phoneDetail.code}');
  //     final userData = await ProfileService.editProfileRegister(registerRowModel);
  //     // await AppPreference.setModelData(userData);
  //     // await AppPreference.setString("profile_image_link", userData.apiResponse?.data?.profileUrl ?? '');
  //     // await AppPreference.setString("user_name", userData.apiResponse?.data?.name ?? '');
  //     if (userData == null) return;
  //     // await AppPreference.setModelData(userData);
  //     AppPreference.setString("user_name", userData.apiResponse?.data?.name ?? '');
  //     await AppPreference.setUserMantra(personalMantraController.text);
  //     Navigation.replaceAll(Routes.homeScreen);
  //     LogUtils.successLog('edit userData :: ${userData.toJson()}');
  //     isLoading.value = false;
  //   } catch (e, st) {
  //     LogUtils.errorLog("registerData error ::$e ST :: $st");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Image Picker variables ==>
  XFile? pickedFile;
  final RxnString pickedImage = RxnString();
  Rx<GenderChange> selectedGender = GenderChange.male.obs;

  /// Image Picker Function ==>
  Future<void> getImage() async {
    final imagePicker = ImagePicker();
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    pickedImage.value = pickedFile!.path;
  }

  // Future<void> dateSelection(BuildContext context) async {
  //   final result = await showDatePicker(
  //     context: context,
  //     firstDate: DateTime(1971),
  //     lastDate: DateTime.now(),
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: ColorScheme.light(
  //             primary: AppColors.greyColor,
  //             onSurface: Colors.white,
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (result == null) return;
  //   selectedBirth = result;
  //   selectedDate.value = DateFormat('MM/dd/yy').format(result);
  //   birthDateController.text = selectedDate.value;
  // }

  /// Create reels
  // RxString pickedVideoPath = ''.obs;
  // RxBool isVideoLoad = false.obs;
  //
  // bool isItAVideo(String path) {
  //   String extension = path.split('.').last.toLowerCase();
  //   return ["mp4", "mov", "wmv", "avi", "avchd", "mkv", "flv", "f4v", "swf"].contains(extension);
  // }
  //
  // bool isLargerThan300MB(XFile file) {
  //   int bytes = File(file.path).lengthSync();
  //   double sizeInMb = bytes / (1024 * 1024);
  //   if (sizeInMb > 300) {
  //     return true;
  //   }
  //   return false;
  // }

  Future<void> pickVideosFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // isVideoLoad.value = true;
    XFile? pickedVideo = await picker.pickVideo(source: ImageSource.gallery, maxDuration: const Duration(seconds: 60));
    // if (pickedVideo == null) {
      return;
    // }
    // if (isItAVideo(pickedVideo.path) == false) {
    //   AppSnackBar.showSnackBarAtTop(message: "Please select a video format file", title: "Error");
    // } else if (isLargerThan300MB(pickedVideo)) {
    //   AppSnackBar.showErrorSnackBar(message: "Please select a file smaller than 300 MB", title: "Error", seconds: 3);
    // } else {
    //   pickedVideoPath.value = pickedVideo.path;
    //   isVideoLoad.value = false;
    //   Navigation.pushNamed(Routes.createdVideoPlayScreen, );
    // }
  }

  // bool callApiInBuildMethod = true;
  //
  // void getMoreReels() async {
  //   if (showPaginationLoader.value == false) {
  //     return;
  //   }
  //   try {
  //     var result = await Api().get(
  //       ApiConstants.getProfile,
  //       queryData: {
  //         "pagenumber": pageNumber,
  //         "pagesize": pageSize,
  //       },
  //     );
  //     allReelsModel = AllReelsModel.fromJson(json.decode(result.body));
  //     if ((allReelsModel?.apiReelResponse.vision.isEmpty ?? true) || ((allReelsModel?.apiReelResponse.vision.length ?? 0) < 10)) {
  //       showPaginationLoader.value = false;
  //     }
  //     if (allReelsModel != null) {
  //       if (allReelsModel!.apiReelResponse.vision.isNotEmpty) {
  //         vision.addAll(allReelsModel!.apiReelResponse.vision);
  //       }
  //     }
  //     pageNumber++;
  //   } catch (_) {}
  // }
  //
  // bool shouldAddDataInList = true;
  //
  // void refreshCallbackOfProfileDetails() async {
  //   RegisterResponseModel result = await ProfileService.getProfile(AppPreference.getLoginUserId());
  //   getUserData.value = result;
  //   networkImage.value = getUserData.value.apiResponse?.data?.profileUrl ?? '';
  //   nameController.text = getUserData.value.apiResponse?.data?.name ?? '';
  //   emailController.text = getUserData.value.apiResponse?.data?.email ?? '';
  //   selectedGender.value =
  //       GenderChange.values.firstWhere((element) => element.value.toUpperCase() == (getUserData.value.apiResponse?.data?.gender ?? "MALE"));
  //   birthDateController.text =
  //       DateFormat('MM/dd/yy').format(DateTime.fromMillisecondsSinceEpoch(getUserData.value.apiResponse?.data?.birthDate ?? 0));
  //   locationController.text = getUserData.value.apiResponse?.data?.location ?? '';
  //   phoneNumberController.text = getUserData.value.apiResponse?.data?.mobileNo ?? '';
  //   careerController.text = getUserData.value.apiResponse?.data?.currentOccupation ?? '';
  //   whoYouAreController.text = getUserData.value.apiResponse?.data?.whoAmI ?? '';
  //   personalMantraController.text = getUserData.value.apiResponse?.data?.personalMantra ?? '';
  //   dropdownValue.value = getUserData.value.apiResponse?.data?.areYouInterestedInMentorship ?? '';
  //   selectedCountry.value = countryList.firstWhere(
  //         (element) => element.phoneDetail.code == getUserData.value.apiResponse?.data?.countryCode,
  //     orElse: () => selectedCountry.value,
  //   );
  // }
  //
  // void refreshCallBackOfReel() async {
  //   pageNumber = 1;
  //   try {
  //     var result = await Api().get(
  //       ApiConstants.getProfile,
  //       queryData: {
  //         "pagenumber": pageNumber,
  //         "pagesize": pageSize,
  //       },
  //     );
  //     allReelsModel = AllReelsModel.fromJson(json.decode(result.body));
  //     vision.clear();
  //     if (allReelsModel != null) {
  //       vision.addAll(allReelsModel!.apiReelResponse.vision);
  //     }
  //     if ((allReelsModel?.apiReelResponse.vision.isEmpty ?? true) || ((allReelsModel?.apiReelResponse.vision.length ?? 0) < 10)) {
  //       showPaginationLoader.value = false;
  //     }
  //     pageNumber++;
  //   } catch (_) {}
  // }
  //
  // void getReels() async {
  //   pageNumber = 1;
  //   await Future.delayed(const Duration(milliseconds: 100));
  //   try {
  //     showLoader.value = true;
  //     var result = await Api().get(
  //       ApiConstants.getProfile,
  //       queryData: {
  //         "pagenumber": pageNumber,
  //         "pagesize": pageSize,
  //       },
  //     );
  //     allReelsModel = AllReelsModel.fromJson(json.decode(result.body));
  //     if (allReelsModel != null) {
  //       if (shouldAddDataInList) {
  //         vision.addAll(allReelsModel!.apiReelResponse.vision);
  //         shouldAddDataInList = false;
  //       }
  //     }
  //     if ((allReelsModel?.apiReelResponse.vision.isEmpty ?? true) || ((allReelsModel?.apiReelResponse.vision.length ?? 0) < 10)) {
  //       showPaginationLoader.value = false;
  //     }
  //     pageNumber++;
  //     showLoader.value = false;
  //     showGridOfReels.value = true;
  //   } catch (_) {}
  // }
  //
  // /// GET PROFILE DETAILS ==>
  // RxBool getProfileLoading = false.obs;
  // RxString getProfileId = ''.obs;
  //
  // Future<void> getProfileDetails() async {
  //   try {
  //     getProfileLoading.value = true;
  //     RegisterResponseModel result = await ProfileService.getProfile(AppPreference.getLoginUserId());
  //     getUserData.value = result;
  //     getProfileLoading.value = false;
  //   } catch (e, st) {
  //     LogUtils.errorLog('getProfileDetails :: error $e :: ST :: $st');
  //   } finally {
  //     getProfileLoading.value = false;
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getReels();
  }
}