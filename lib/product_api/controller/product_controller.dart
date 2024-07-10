import 'package:api_demo_task/product_api/model/product_model.dart';

import 'package:api_demo_task/product_api/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    productApi();
  }

  RxBool isLoading = false.obs;

  RxList<productDetailModel> productDetailList = <productDetailModel>[].obs;

  Future productApi() async {
    try {
      isLoading.value = true;
      productDetailList.value = await ProductService.productData();
    } catch (e) {
      print("productApi error :: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
