import 'package:api_demo_task/post_api/model/api_model.dart';
import 'package:api_demo_task/post_api/service/api_service.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:get/get.dart';

RxBool isLoading = false.obs;

class ApiController extends GetxController {
  RxList<ApiViewModel> apiViewModel = <ApiViewModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getApi();
  }

  Future getApi() async {
    try {
      isLoading.value = true;

      apiViewModel.value = await ApiService.apiData();

    } catch (e, st) {
      LogUtils.errorLog(" e :: $e , st :: $st");
    } finally {
      isLoading.value = false;
    }
  }
}
