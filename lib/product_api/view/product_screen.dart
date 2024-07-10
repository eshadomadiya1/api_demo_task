import 'package:api_demo_task/product_api/controller/product_controller.dart';
import 'package:api_demo_task/product_api/controller/theme_controller.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ThemeController.to.isDarkMode,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          Obx(() => Switch(
            activeColor: Colors.black,
            value: ThemeController.to.isDarkMode,
            onChanged: (value) {
              ThemeController.to.toggleTheme();
            },
          )),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),

    body: Obx(
            () =>
                Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: "shopX",
                    color: ThemeController.to.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigation.pushNamed(Routes.settingScreen);
                  },
                  icon: Icon(
                    Icons.settings,
                    color: ThemeController.to.textColor,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                  },
                  icon: Icon(
                    Icons.view_list_rounded,
                    color: ThemeController.to.textColor,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.grid_view,
                    color: ThemeController.to.textColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: productController.productDetailList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  var data = productController.productDetailList[index];

                  print("data length :: ${data.productLink?.length ?? ''}");

                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: data.imageLink ?? '',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            margin: EdgeInsets.all(40),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          ),
                          errorWidget: (context, url, error) => Image.asset('assets/images/makeup.jpg'),
                        ).paddingOnly(
                          bottom: 60,
                          right: 25,
                          left: 14,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonText(
                            maxLine: 1,
                            textAlign: TextAlign.center,
                            text: data.name ?? '',
                            fontSize: 15,
                            color: ThemeController.to.textColor,
                            fontWeight: FontWeight.w600,
                          ).paddingSymmetric(vertical: 5, horizontal: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                maxLine: 1,
                                textAlign: TextAlign.center,
                                text: data.priceSign ?? '',
                                fontSize: 20,
                                color: ThemeController.to.textColor,
                                fontWeight: FontWeight.w500,
                              ).paddingOnly(right: 5),
                              CommonText(
                                maxLine: 1,
                                textAlign: TextAlign.center,
                                text: data.price ?? '',
                                fontSize: 20,
                                color: ThemeController.to.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ).paddingOnly(bottom: 10),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
