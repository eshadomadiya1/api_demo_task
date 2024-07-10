import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/user_api/model/user_api_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';
import 'package:api_demo_task/utils/log_utils.dart';

class UserApiService {
  static Future<List<UserApiModel>> userApiData() async {
    try {
      var response = await Api().get(
        ApiConstants.userApi,
      );

      List<UserApiModel> userApiModelList = [];
      var user = jsonDecode(response.body);
      for (var u in user) {
        userApiModelList.add(UserApiModel.fromJson(u));
      }
      LogUtils.successLog(" status : ${response.statusCode} body:${response.body}");
      LogUtils.debugLog(" apiViewList : $userApiModelList");
      return userApiModelList;
    } catch (e, st) {
      LogUtils.errorLog(" error : E $e st : $st");
      rethrow;
    }
  }
}
