import 'package:api_demo_task/post_api/controller/api_controller.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiScreen extends StatelessWidget {
   ApiScreen({super.key});
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView.builder(
          shrinkWrap: true,
          itemCount: apiController.apiViewModel.length,
          itemBuilder: (context, index) {
            var result = apiController.apiViewModel[index];
            // LogUtils.debugLog("result --> $result");
          return
            Card(
              color: Colors.white24,
              child: ListTile(
              title: CommonText(text :result.id.toString(),color: Colors.black,fontSize: 20),
              subtitle: CommonText(text :result.title.toString(),
                  color: Colors.black45,fontSize: 17),
                              ),
            );
        },).paddingSymmetric(horizontal: 10),
    );
  }
}
