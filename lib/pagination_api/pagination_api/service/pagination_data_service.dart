import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/api/responce_handler.dart';
import 'package:api_demo_task/pagination_api/pagination_api/model/pagination_response_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';

class PaginationDataService {
  static Future<List<PaginationResponseModel>> paginationData({required int page, required int limit}) async {
    final response = await Api().get(ApiConstants.posts, queryData: {"_page": page, "_limit": limit});
    await ResponseHandler.checkResponseError(response);
    List<PaginationResponseModel> dataList = [];
    var data = jsonDecode(response.body);
    for (var d in data) {
      dataList.add(PaginationResponseModel.fromJson(d));
    }
    return dataList;
  }
}
