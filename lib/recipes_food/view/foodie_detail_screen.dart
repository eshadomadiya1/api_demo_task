import 'package:api_demo_task/recipes_food/controller/foddie_controller.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FoodieDetailScreen extends StatefulWidget {
  const FoodieDetailScreen({super.key});

  @override
  State<FoodieDetailScreen> createState() => _FoodieDetailScreenState();
}

FoodieDataController foodieDataController = Get.put(FoodieDataController());

String? isImage;
int? isIndex;

class _FoodieDetailScreenState extends State<FoodieDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null) {
      var args = Get.arguments ?? {};
      isImage = args['isImage'];
      isIndex = args['index'];
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = foodieDataController.foodiDatamodel.value.recipes?[isIndex ?? 0];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl: isImage ?? '',
                        placeholder: (context, url) => Container(
                            margin: EdgeInsets.all(
                              40,
                            ),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            )),
                        errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png'),
                      )),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      height: 37,
                      width: 37,
                      child: GestureDetector(
                          onTap: () {
                            // print("value :: ${foodieDataController.foodiDatamodel.value.recipes?[index].isSelect} ");
                            foodieDataController.onClick(isIndex ?? 0);
                          },
                          child: (foodieDataController.foodiDatamodel.value.recipes?[isIndex ?? 0].isSelect?.value ?? false)
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border_outlined,
                                )),
                    ).paddingAll(12),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CommonText(
                  textAlign: TextAlign.center,
                  text: data?.name ?? '',
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ).paddingOnly(top: 10),
            Row(
              children: [
                CommonText(
                  textAlign: TextAlign.center,
                  text: 'ingredients',
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(top: 25),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data?.ingredients?.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CommonText(
                      textAlign: TextAlign.center,
                      text: data?.ingredients?[index] ?? '',
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                );
              },
            ),
            Row(
              children: [
                CommonText(
                  textAlign: TextAlign.center,
                  text: 'instructions',
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(top: 25),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data?.instructions?.length,
              itemBuilder: (context, index) {
                return CommonText(
                  textAlign: TextAlign.center,
                  text: data?.instructions?[index] ?? '',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}
