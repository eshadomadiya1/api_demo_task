import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/post_api/model/api_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';
import 'package:api_demo_task/utils/log_utils.dart';

class ApiService{

  static Future<List<ApiViewModel>> apiData() async {
    try {
      var response = await Api().get(
        ApiConstants.postApi,
      );
      List<ApiViewModel> apiViewList = [];
      var data = jsonDecode(response.body);
      for(var d in data){
        apiViewList.add(ApiViewModel.fromJson(d));
      }

      LogUtils.successLog(" status : ${response.statusCode} body:${response.body}");
      LogUtils.debugLog(" apiViewList : $apiViewList");
      return apiViewList;

    } catch (e, st) {
      LogUtils.errorLog(" error : E $e st : $st");
      rethrow;
    }
  }
}