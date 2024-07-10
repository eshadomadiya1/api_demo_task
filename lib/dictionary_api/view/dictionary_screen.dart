import 'package:api_demo_task/dictionary_api/controller/dictionary_controller.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DictionaryScreen extends StatelessWidget {
  DictionaryScreen({super.key});

  DictionaryController dictionaryController = Get.put(DictionaryController());

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(
          () => Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  dictionaryController.dictionaryApi(word: value);
                },
                controller: nameController,
                validator: (value) => value == null ? 'please enter password' : null,
                decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.white60)),
                    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.white60)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.white60)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.white60)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    fillColor: Colors.white,
                    filled: true),
              ).paddingSymmetric(vertical: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: dictionaryController.dictionaryList.length,
                  // itemCount: 1,
                  itemBuilder: (context, index) {
                    var data = dictionaryController.dictionaryList[index];

                    return Card(
                      child: Column(
                        children: [
                          CommonText(
                            text: data.word ?? '',
                            color: Colors.black,

                          ),
                          CommonText(
                            text: data.phonetics?[index].license?.name.toString() ?? '',
                            color: Colors.black,
                          ),
                        ],
                      ).paddingSymmetric(vertical: 10),
                    );
                  },
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 12, vertical: 15),
        ),
      ),
    );
  }
}
