import 'package:api_demo_task/pagination_api/pagination_api/model/pagination_response_model.dart';
import 'package:api_demo_task/pagination_api/pagination_api/service/pagination_data_service.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
  RxList<PaginationResponseModel> dataList = <PaginationResponseModel>[].obs;
  RxInt pageNumber = 1.obs;
  RxBool isLoading = false.obs;
  RxBool isLoader = false.obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    paginationDataShow(pageNumber: pageNumber.value);
  }

  Future paginationDataShow({required int pageNumber}) async {
    try {
      pageNumber++;
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));

      List<PaginationResponseModel> newData = await PaginationDataService.paginationData(page: pageNumber, limit: 15);
      isLoader.value = false;
      dataList.addAll(newData);
      isLoading.value = false;
    } catch (e, st) {
      isLoading.value = false;
      LogUtils.debugLog("paginationDataShow error :: $e st ::  $st");
    }
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      pageNumber++;
      paginationDataShow(pageNumber: pageNumber.value);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
