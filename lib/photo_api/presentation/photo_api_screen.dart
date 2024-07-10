import 'package:api_demo_task/photo_api/controller/photo_api_controller.dart';
import 'package:api_demo_task/post_api/controller/api_controller.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoApiScreen extends StatelessWidget {
   PhotoApiScreen({super.key});
   PhotoApiController photoApiController = Get.put(PhotoApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Obx(
          ()=> ListView.builder(
            shrinkWrap: true,
            itemCount: photoApiController.apiPhotoViewModel.length,
            itemBuilder: (context, index) {
              var result = photoApiController.apiPhotoViewModel[index];
              // LogUtils.debugLog("result --> $result");
            return
              Card(
                color: Colors.white24,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(60),

                      child: Image.network(result.thumbnailUrl ?? '')),
                title: CommonText(text :result.id.toString(),color: Colors.black,fontSize: 20),
                subtitle: CommonText(text :result.title.toString(),
                    color: Colors.black45,fontSize: 17),
                                ),
              );
          },).paddingSymmetric(horizontal: 10),
        ),
    );
  }
}
