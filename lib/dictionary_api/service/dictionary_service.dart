import 'dart:convert';

import 'package:api_demo_task/api/api.dart';
import 'package:api_demo_task/dictionary_api/model/dictionary_model.dart';
import 'package:api_demo_task/utils/api_constants.dart';

class DictionaryService{
  static Future<List<DictionaryDataModel>> dictionaryService({String? word}) async {
    var response = await Api().get(ApiConstants.dictionaryApi + "$word");
    List<DictionaryDataModel> dictionaryDataList = [];
    var d = jsonDecode(response.body);
    for(var data in d){
      dictionaryDataList.add(DictionaryDataModel.fromJson(data));
    }
    print("response -- ${response.statusCode} -- body -- ${response.body}");

    return dictionaryDataList;
}

}