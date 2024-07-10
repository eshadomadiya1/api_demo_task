
import 'package:api_demo_task/dictionary_api/model/dictionary_model.dart';
import 'package:api_demo_task/dictionary_api/service/dictionary_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class DictionaryController extends GetxController{
  RxBool isLoader = false.obs;
  RxList<DictionaryDataModel> dictionaryList = <DictionaryDataModel>[].obs;

  Future dictionaryApi({String? word}) async {
    try{
      isLoader.value = true;
      dictionaryList.value = await DictionaryService.dictionaryService(word:word);
      isLoader.value = false;
    }
    catch(e,st){
      print("error :: $e -- st>> $st");
      isLoader.value = false;
    }
    finally{
      isLoader.value = true;
    }

  }
}