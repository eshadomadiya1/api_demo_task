import 'package:api_demo_task/pagination_api/pagination_api/controller/pagination_controller.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationDataDisplay extends StatelessWidget {
  PaginationDataDisplay({super.key});

  PaginationController _paginationController = Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (_paginationController.isLoader.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      } else {
        return
          Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _paginationController.scrollController,
                itemCount: _paginationController.dataList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CommonText(
                        text: _paginationController.dataList[index].id.toString(),
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      title: CommonText(
                        maxLine: 1,
                        text: _paginationController.dataList[index].title ?? "",
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ).paddingOnly(bottom: 8),
                      subtitle: CommonText(
                        maxLine: 2,
                        text: _paginationController.dataList[index].body ?? "",
                        fontSize: 16,
                        color: Colors.indigo,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_paginationController.isLoading.value ?? false)
              Container(
                height: 25,
                width: 25,
                margin: const EdgeInsets.all(15),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.black,
                ),
              )
          ],
        ).paddingSymmetric(horizontal: 8);
      }
    }));
  }
}
