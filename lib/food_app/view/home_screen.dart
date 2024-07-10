import 'package:api_demo_task/food_app/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  FoodController foodController = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
      ),
      body:  ListView.builder(
      itemCount: foodController.foodResponseModel.value.image?.length ?? 0,
      // itemCount: 4,
      itemBuilder: (context, index) {
        var result = foodController.foodResponseModel.value.image?[index];
        return ListTile(
          title: Text(result?.hostedLargeUrl.toString() ?? ''),
          subtitle: Text(result?.resizableImageUrl.toString() ?? ''),
        );
      },
    )
    );
  }
}
