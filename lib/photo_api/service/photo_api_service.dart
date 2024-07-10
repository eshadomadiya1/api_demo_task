import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/photo_api/model/photos_api_model.dart';
import 'package:api_demo_task/post_api/model/api_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:get/get.dart';

class ApiServices {

  static Future<List<PhotosViewModel>> photoApiData() async {
    try {
      var response = await Api().get(
        ApiConstants.photosApi,
      );
      List<PhotosViewModel> photosViewModelList = [];
      var result = jsonDecode(response.body);
      for (var d in result) {
        photosViewModelList.add(PhotosViewModel.fromJson(d));
      }
      LogUtils.successLog(" status : ${response.statusCode} body:${response.body}");
      LogUtils.debugLog(" photosViewModel : $photosViewModelList");
      return photosViewModelList;
    } catch (e, st) {
      LogUtils.errorLog(" error : E $e st : $st");
      rethrow;
    }
  }
}
