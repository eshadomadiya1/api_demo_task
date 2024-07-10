import 'dart:convert';
import 'dart:developer';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/product_api/model/product_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';

class ProductService {
  static Future<List<productDetailModel>> productData() async {
    var response = await Api().get(
      ApiConstants.product,
    );

    List<productDetailModel> productDataList = [];
    var data = jsonDecode(response.body);
    for (var d in data) {
      productDataList.add(productDetailModel.fromJson(d));
    }

    log("status-code --${response.statusCode} -- body :: ${response.body}");

    return productDataList;
  }
}
