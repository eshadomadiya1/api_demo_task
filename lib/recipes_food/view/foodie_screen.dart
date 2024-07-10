import 'package:api_demo_task/recipes_food/controller/foddie_controller.dart';
import 'package:api_demo_task/recipes_food/model/foodie_model.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../utils/navigation_utils/navigation.dart';

class FoodieScreen extends StatefulWidget {
  FoodieScreen({super.key});

  @override
  State<FoodieScreen> createState() => _FoodieScreenState();
}

class _FoodieScreenState extends State<FoodieScreen> {
  FoodieDataController foodieDataController = Get.put(FoodieDataController());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigation.pushNamed(Routes.foodieLikeScreen, arg: {});
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                width: 140,
                child: Row(
                  children: [
                    CommonText(
                      text: 'Liked data',
                      color: Colors.black,
                      fontSize: 18,
                    ).paddingOnly(right: 10),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ).paddingAll(10),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => MasonryGridView.count(
          itemCount: foodieDataController.foodiDatamodel.value.recipes?.length,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            var data = foodieDataController.foodiDatamodel.value.recipes?[index];
            return GestureDetector(
              onTap: () {
                Navigation.pushNamed(Routes.foodieDetailScreen, arg: {
                  "isImage": data?.image,
                  "index": index,
                });
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2), border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                      // height: 120,
                      //   width: 120,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: data?.image ?? '',
                            placeholder: (context, url) => Container(
                                margin: EdgeInsets.all(
                                  40,
                                ),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                )),
                            errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png'),
                          ),
                          CommonText(
                            textAlign: TextAlign.start,
                            text: data?.name ?? '',
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ).paddingAll(8),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      CommonText(
                                        text: data?.rating?.toString() ?? 'No Rating',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.black,
                                        size: 20,
                                      )
                                    ],
                                  ).paddingSymmetric(horizontal: 5, vertical: 4),
                                ),
                              ),
                              // CommonText(
                              //   text: data?.cuisine ?? '',
                              //   color: Colors.grey.shade600,
                              //   fontSize: 18,
                              //   fontWeight: FontWeight.w400,
                              // ).paddingOnly(bottom: 5),
                            ],
                          ).paddingOnly(left: 10, right: 10, bottom: 10)
                        ],
                      ),
                    ),
                  ),
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
                            foodieDataController.onClick(index);
                          },
                          child: (foodieDataController.foodiDatamodel.value.recipes?[index].isSelect?.value ?? false)
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border_outlined,
                                )),
                    ).paddingAll(8),
                  )
                ],
              ),
            );
          },
        ).paddingSymmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
