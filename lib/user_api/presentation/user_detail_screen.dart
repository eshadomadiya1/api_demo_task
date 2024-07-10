import 'package:api_demo_task/user_api/controller/user_api_controller.dart';
import 'package:api_demo_task/user_api/model/user_api_model.dart';
import 'package:api_demo_task/user_api/presentation/user_api_screen.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/custom_button.dart';
import 'package:api_demo_task/widget/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/details_widget.dart';

class UserDetailScreen extends StatefulWidget {
  UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.arguments != null) {
        var arguments = Get.arguments;
        name = arguments['name'];
        email = arguments['email'];
        city = arguments['city'];
        zipcode = arguments['zipcode'];
        lat = arguments['lat'];
        lng = arguments['lng'];
        phone = arguments['phone'];
        companyName = arguments['companyName'];

        userApiController.nameController.text = name ?? '';
        userApiController.emailController.text = email ?? '';
        userApiController.cityController.text = city ?? '';
        userApiController.zipCodeController.text = zipcode ?? '';
        userApiController.latitudeController.text = lat ?? '';
        userApiController.longitudeController.text = lng ?? '';
        userApiController.phoneNumberController.text = phone ?? '';
        userApiController.websiteController.text = website ?? '';
        userApiController.companyController.text = companyName ?? '';
        print("args --$arguments");
      }
    });
    // TODO: implement initState
    super.initState();
  }

  final UserApiController userApiController = Get.put(UserApiController());
  String? name;
  String? email;
  String? city;
  String? zipcode;
  String? lat;
  String? lng;
  String? phone;
  String? website;
  String? companyName;

  @override
  Widget build(BuildContext context) {
    // userApiController.nameController.text = userApiController.userApiModel.value.last.toString();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: userApiController.nameController,
              ),
              CustomTextField(
                hintText: "Enter Email",
                controller: userApiController.emailController,
              ).paddingSymmetric(vertical: 8),
              CustomTextField(
                hintText: "Enter City",
                controller: userApiController.cityController,
              ),
              CustomTextField(
                hintText: "Enter Zipcode",
                controller: userApiController.zipCodeController,
              ).paddingSymmetric(vertical: 8),
              CustomTextField(
                hintText: "Enter latitude",
                controller: userApiController.latitudeController,
              ),
              CustomTextField(
                hintText: "Enter longitude",
                controller: userApiController.longitudeController,
              ).paddingSymmetric(vertical: 8),
              CustomTextField(
                hintText: "Enter phoneNumber",
                controller: userApiController.phoneNumberController,
              ),
              CustomTextField(
                hintText: "Enter website",
                controller: userApiController.websiteController,
              ).paddingSymmetric(vertical: 8),
              CustomTextField(
                hintText: "Enter Company Name",
                controller: userApiController.companyController,
              ),
            ],
          ).paddingSymmetric(horizontal: 10),
        ),
        floatingActionButton: IntrinsicHeight(
            child: GestureDetector(
          onTap: () {
            // userApiController.userApiModel.add(UserApiModel(
            //     name: userApiController.nameController.text,
            //     email: userApiController.emailController.text,
            //     address: Address(
            //         city: userApiController.cityController.text,
            //         zipcode: userApiController.zipCodeController.text,
            //         geo: Geo(
            //           lat: userApiController.latitudeController.text,
            //           lng: userApiController.longitudeController.text,
            //         )),
            //     phone: userApiController.phoneNumberController.text,
            //     website: userApiController.websiteController.text,
            //     company: Company(
            //       name: userApiController.companyController.text,
            //     )));
            Navigation.pushNamed(Routes.userApiScreen, arg: {
              'isUpdate': true,
            });
          },
          child: const CustomButton(
            text: 'add',
            buttonColor: Colors.grey,
          ).paddingOnly(left: 30),
        )),
      ),
    );
  }
}
