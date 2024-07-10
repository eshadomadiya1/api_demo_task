import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/recipes_food/model/foodie_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';

class FoodieDtaService {
  static Future<FoodieDataModel> foodieData() async {
    var response = await Api().get(ApiConstants.foodieDataApi);
      return FoodieDataModel.fromJson(jsonDecode(response.body));
  }
}
