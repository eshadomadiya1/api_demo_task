import 'dart:convert';
import 'package:api_demo_task/food_app/model/food_model.dart';
import 'package:api_demo_task/food_app/service/food_service.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  @override
  void onInit() {
    getFoodData();
    super.onInit();
  }

  Rx<FoodApiModel> foodResponseModel = FoodApiModel().obs;

  Future getFoodData() async {
    try {
      foodResponseModel.value = await FoodService.foodDataService();
    } catch (e, st) {
      print("getFoodData()-----$e $st");
    }
  }
}
