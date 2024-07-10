import 'package:api_demo_task/user_api/model/user_api_model.dart';
import 'package:api_demo_task/user_api/service/user_api_service.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

RxBool isLoading = false.obs;

class UserApiController extends GetxController {


  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final websiteController = TextEditingController();
  final companyController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserApi();
  }
  RxList<UserApiModel> userApiModel = <UserApiModel>[].obs;
  Future getUserApi() async {
    try {
      isLoading.value = true;

      userApiModel.value = await UserApiService.userApiData();

    } catch (e, st) {
      LogUtils.errorLog(" e :: $e , st :: $st");
    } finally {
      isLoading.value = false;
    }
  }
}
