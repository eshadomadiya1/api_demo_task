import 'package:api_demo_task/user_api/controller/user_api_controller.dart';
import 'package:api_demo_task/utils/log_utils.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserApiScreen extends StatefulWidget {
  const UserApiScreen({super.key});

  @override
  State<UserApiScreen> createState() => _UserApiScreenState();
}

class _UserApiScreenState extends State<UserApiScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Get.arguments != null){
      var argument = Get.arguments;
      isUpdate = argument['isUpdate'];

    }
  }
  UserApiController userApiController = Get.put(UserApiController());
  bool? isUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: userApiController.userApiModel.length,
          itemBuilder: (context, index) {
            var result = userApiController.userApiModel[index];
            LogUtils.debugLog("result --> $result");
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigation.pushNamed(Routes.userDetailScreen, arg: {
                      'name': result.name,
                      'email': result.email,
                      'city': result.address?.city,
                      'zipcode': result.address?.zipcode,
                      'lat': result.address?.geo?.lat,
                      'lng': result.address?.geo?.lng,
                      'phone': result.phone,
                      'website': result.website,
                      'companyName': result.company?.name,
                      // 'index': index,

                    });
                  },
                  child: Card(
                    color: Colors.white24,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(text: (isUpdate ?? false) ? userApiController.nameController.text : result.name.toString(), color: Colors.black, fontSize: 20),
                          CommonText(text: result.username.toString(), color: Colors.indigo, fontSize: 13),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          const Row(
                            children: [
                              CommonText(
                                text: "Details",
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ).paddingSymmetric(vertical: 12),
                          Row(
                            children: [
                              CommonText(text: "Email : ${result.email.toString()}", color: Colors.black87, fontSize: 17),
                            ],
                          ).paddingSymmetric(vertical: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(text: 'city : ${result.address?.city.toString()}', color: Colors.black87, fontSize: 16),
                              const SizedBox(
                                width: 20,
                              ),
                              CommonText(text: 'zipcode : ${result.address?.zipcode.toString()}', color: Colors.black87, fontSize: 16),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(text: 'latitude : ${result.address?.geo?.lat.toString() ?? ''}', color: Colors.black, fontSize: 17),
                              CommonText(text: 'longitude : ${result.address?.geo?.lng.toString() ?? ''}', color: Colors.black, fontSize: 17),
                            ],
                          ).paddingSymmetric(vertical: 5),
                          Row(
                            children: [
                              CommonText(text: 'PhoneNumber : ${result.phone.toString()}',color: Colors.black, fontSize: 17),
                            ],
                          ),
                          Row(
                            children: [
                              CommonText(text: 'website : ${result.website ?? ''}', color: Colors.black, fontSize: 17),
                            ],
                          ).paddingSymmetric(vertical: 5),
                          Row(
                            children: [
                              CommonText(text: 'company name : ${result.company?.name ?? ''}', color: Colors.black, fontSize: 17),
                            ],
                          ).paddingSymmetric(vertical: 5),
                        ],
                      ),
                    ),
                  ).paddingSymmetric(vertical: 2),
                ),
                Positioned(
                    bottom: 15,
                    right: 15,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              userApiController.userApiModel.removeAt(index);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigation.pushNamed(
                                Routes.userDetailScreen,
                              );
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                            )),
                      ],
                    )),
              ],
            );
          },
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
