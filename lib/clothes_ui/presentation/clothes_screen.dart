import 'package:api_demo_task/clothes_ui/controller/clothes_controller.dart';
import 'package:api_demo_task/clothes_ui/widget/clothes_details_card.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/utils/app_string.dart';
import 'package:api_demo_task/utils/assets.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductDataController productController = Get.put(ProductDataController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        elevation: 5,
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            size: 25,
            color: Colors.black,
          ).paddingOnly(right: 10),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(170),
          child: Column(
            children: [
              Row(
                children: [
                  CommonText(
                    text: AppString.womenTop,
                    color: AppColors.blackColor,
                    fontSize: 38,
                    fontWeight: FontWeight.w800,
                  ).paddingSymmetric(horizontal: 14, vertical: 16),
                ],
              ),
              Container(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: productController.productTypeList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: CommonText(
                        text: productController.productTypeList[index],
                        color: Colors.white,
                        fontSize: 18,
                      ).paddingSymmetric(horizontal: 16, vertical: 12),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                ),
              ).paddingOnly(left: 12),
              Container(
                height: 40,
                color: AppColors.iconColor.withOpacity(0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(0, 230, 50, 50),
                          items: [
                            PopupMenuItem<int>(
                              value: 0,
                              child: Text('Clothes Type - Ascending'),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Text('Clothes Type - Descending'),
                            ),
                            PopupMenuItem<int>(
                              value: 2,
                              child: Text('Price - Ascending'),
                            ),
                            PopupMenuItem<int>(
                              value: 3,
                              child: Text('Price - Descending'),
                            ),
                          ],
                        ).then((value) {
                          if (value != null) {
                            switch (value) {
                              case 0:
                                productController.sortProductsByTitle(true);
                                break;
                              case 1:
                                productController.sortProductsByTitle(false);
                                break;
                              case 2:
                                productController.sortProductsByPrice(true);
                                break;
                              case 3:
                                productController.sortProductsByPrice(false);
                                break;
                            }
                          }
                        });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            IconsAsset.filterICon,
                            height: 14,
                          ).paddingOnly(right: 10),
                          CommonText(
                            text: AppString.filters,
                            fontSize: 17,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          IconsAsset.upDownIcon,
                          height: 22,
                        ).paddingOnly(right: 10),
                        CommonText(
                          text: AppString.filters,
                          fontSize: 17,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          IconsAsset.viewIcon,
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: 14, vertical: 18)
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Obx(() {
              return ListView.builder(
                itemCount: productController.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: productController.products[index],
                    index: index,
                    onFavoritePressed: (index) {
                      productController.toggleFavorite(index);
                    },
                  );
                },
              ).paddingSymmetric(horizontal: 14, vertical: 12);
            }),
          ),
        ],
      ),
    );
  }
}
