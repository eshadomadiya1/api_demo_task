import 'package:api_demo_task/recipes_food/model/foodie_model.dart';
import 'package:api_demo_task/recipes_food/service/foodie_service.dart';
import 'package:get/get.dart';

class FoodieDataController extends GetxController {


  Rx<FoodieDataModel> foodiDatamodel = FoodieDataModel().obs;



  // RxBool isSelect = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    foodieDetails();

  }

  bool? isImage;

  void onClick(int index){
    var data = foodiDatamodel.value.recipes?[index];
    if(data != null){
      data.isSelect?.value = !(data.isSelect?.value ?? true);
      foodiDatamodel.refresh();
    }
  }

  List<Recipes>? getAllLikedProducts() {
    return foodiDatamodel.value.recipes
        ?.where((product) => (product.isSelect?.value ?? true))
        .toList();
  }

  Future foodieDetails() async {
    foodiDatamodel.value = await FoodieDtaService.foodieData();
  }
}
