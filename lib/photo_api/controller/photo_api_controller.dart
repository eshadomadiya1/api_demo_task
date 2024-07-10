import 'package:api_demo_task/photo_api/model/photos_api_model.dart';
import 'package:api_demo_task/photo_api/service/photo_api_service.dart';
import 'package:api_demo_task/post_api/model/api_model.dart';
import 'package:api_demo_task/post_api/service/api_service.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:get/get.dart';

RxBool isLoading = false.obs;

class PhotoApiController extends GetxController {
  RxList<PhotosViewModel> apiPhotoViewModel = <PhotosViewModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPhotosApi();
  }

  Future getPhotosApi() async {
    try {
      isLoading.value = true;

      apiPhotoViewModel.value = await ApiServices.photoApiData();

    } catch (e, st) {
      LogUtils.errorLog(" e :: $e , st :: $st");
    } finally {
      isLoading.value = false;
    }
  }
}
