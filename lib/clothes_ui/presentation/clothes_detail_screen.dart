import 'package:api_demo_task/clothes_ui/controller/clothes_controller.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ClothesDetailScreen extends StatefulWidget {
  const ClothesDetailScreen({super.key});

  @override
  State<ClothesDetailScreen> createState() => _ClothesDetailScreenState();
}

class _ClothesDetailScreenState extends State<ClothesDetailScreen> {

  final ProductDataController productController = Get.put(ProductDataController());

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      var args = Get.arguments;
      title = args['title'];
      brand = args['brand'];
      price = args['price'];
      rating = args['rating'];
      reviews = args['reviews'];
      imageUrl = args['imageUrl'];
      isFavorite = (args['isFavorite'] as bool).obs; // Convert bool to RxBool
      index = args['index'];
    }
  }

  String? title;
  String? brand;
  String? price;
  dynamic rating;
  String? reviews;
  String? imageUrl;
  RxBool? isFavorite;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 380,
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.greyColor),
                    ),
                    height: 160,
                    child: Image.asset(
                      imageUrl.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 10),
              Row(
                children: [
                  CommonText(
                    text: title.toString(),
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                children: [
                  CommonText(
                    text: brand.toString(),
                    color: AppColors.blackColor,
                    fontSize: 18,
                  ).paddingSymmetric(vertical: 4),
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      i < rating ? Icons.star : Icons.star_border_outlined,
                      color: i < rating ? AppColors.orangeColor : Colors.grey,
                      size: 20,
                    ),
                  CommonText(
                    text: '(${reviews})',
                    color: AppColors.greyColor,
                    fontSize: 17,
                  ).paddingSymmetric(vertical: 4, horizontal: 3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: price.toString(),
                    color: AppColors.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ).paddingSymmetric(vertical: 4),
                  GestureDetector(
                    onTap: () {
                      productController.toggleFavorite(index ?? 0);
                      isFavorite?.value = !isFavorite!.value; // Toggle the RxBool value
                    },
                    child: Obx(
                          () => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.whiteColor,
                        ),
                        child: Icon(
                          isFavorite?.value ?? false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite?.value ?? false
                              ? AppColors.redColor
                              : AppColors.greyColor,
                        ).paddingAll(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 12, vertical: 16),
        ).paddingAll(16),
      ),
    );
  }
}
