import 'package:api_demo_task/recipes_food/controller/foddie_controller.dart';
import 'package:flutter/material.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class FoodieLikeScreen extends StatelessWidget {
  FoodieLikeScreen({super.key});

  FoodieDataController foodieDataController = Get.put(FoodieDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: 'Liked Recipes',
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      body: Obx(
            () {
          var likedRecipes = foodieDataController.getAllLikedProducts();
          return likedRecipes?.isEmpty ?? true
              ? Center(
            child: CommonText(
              text: "No liked recipes",
              fontSize: 20,
              color: Colors.black,
            ),
          )
              : MasonryGridView.count(
            itemCount: likedRecipes?.length ?? 0,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemBuilder: (context, index) {
              var data = likedRecipes?[index];
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: data?.image ?? '',
                            placeholder: (context, url) => Container(
                                margin: EdgeInsets.all(40),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.black,
                                )),
                            errorWidget: (context, url, error) =>
                                Image.asset(
                                    'assets/images/placeholder.png'),
                          ),
                          CommonText(
                            textAlign: TextAlign.center,
                            text: data?.name ?? 'No Name',
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ).paddingAll(8),
                          CommonText(
                            textAlign: TextAlign.center,
                            text: data?.cuisine ?? '',
                            color: Colors.grey.shade600,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ).paddingOnly(bottom: 5)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    height: 37,
                    width: 37,
                    child: GestureDetector(
                      onTap: () {
                        likedRecipes?[index].isSelect?.value = !(likedRecipes[index].isSelect?.value ?? true);
                      },
                      child: (data?.isSelect?.value ?? false)
                          ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : Icon(
                        Icons.favorite_border_outlined,
                      ),
                    ),
                  ).paddingAll(8),
                ],
              );
            },
          ).paddingSymmetric(horizontal: 10, vertical: 12);
        },
      ),
    );
  }
}
