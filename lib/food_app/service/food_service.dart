import 'dart:convert';
import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/api/responce_handler.dart';
import 'package:api_demo_task/food_app/model/food_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class FoodService {
  static Future<FoodApiModel> foodDataService() async {
    // final response = await http.get(ApiConstants.foodApi,
    //     header: {
    //       'x-rapidapi-host': 'yummly2.p.rapidapi.com',
    //       'x-rapidapi-key': 'fa17f9d41bmshf63645c5906617ap10439ejsn3585ec538204'
    //     }
    // );

    final response = await http.get(Uri.parse('https://yummly2.p.rapidapi.com/feeds/list'),
        headers: {
              'x-rapidapi-host': 'yummly2.p.rapidapi.com',
              'x-rapidapi-key': 'fa17f9d41bmshf63645c5906617ap10439ejsn3585ec538204'
            }
    );
    await ResponseHandler.checkResponseError(response);
    print("status-code--- ${response.statusCode} body-- ${response.body} ");
    return FoodApiModel.fromJson(jsonDecode(response.body));
  }
}
