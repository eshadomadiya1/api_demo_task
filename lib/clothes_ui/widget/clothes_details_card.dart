import 'package:api_demo_task/clothes_ui/model/clothes_model.dart';
import 'package:api_demo_task/utils/app_colors.dart';
import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  final Function(int) onFavoritePressed;

  ProductCard({
    required this.product,
    required this.index,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigation.pushNamed(Routes.clothesDetailScreen, arg: {
              'title': product.title,
              'brand': product.brand,
              'price': product.price,
              'rating': product.rating,
              'reviews': product.reviews,
              'imageUrl': product.imageUrl,
              'isFavorite': product.isFavorite,
              'index': index,
            });
          },
          child: Card(
              color: AppColors.whiteColor,
              child: Row(
                children: [
                  Container(
                      height: 120,
                      child: Image.asset(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      )).paddingOnly(right: 16),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: product.title,
                            color: AppColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          CommonText(
                            text: product.brand,
                            color: AppColors.greyColor,
                            fontSize: 18,
                          ).paddingSymmetric(vertical: 4),
                          Row(
                            children: [
                              for (int i = 0; i < 5; i++)
                                Icon(
                                  i < product.rating ? Icons.star : Icons.star_border_outlined,
                                  color: i < product.rating ? AppColors.orangeColor : Colors.grey,
                                  size: 20,
                                ),
                              CommonText(
                                text: '(${product.reviews})',
                                color: AppColors.greyColor,
                                fontSize: 17,
                              ).paddingSymmetric(vertical: 4, horizontal: 3),
                            ],
                          ),
                          CommonText(
                            text: '${product.price}',
                            color: AppColors.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ).paddingSymmetric(vertical: 5),
                        ],
                      ),
                    ],
                  ),
                ],
              )).paddingSymmetric(vertical: 12),
        ),
        Positioned(
          right: 3,
          bottom: 2,
          child: GestureDetector(
            onTap: () => onFavoritePressed(index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.whiteColor,
              ),
              child: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: product.isFavorite ? AppColors.redColor : AppColors.greyColor,
              ).paddingAll(12),
            ),
          ),
        ),
      ],
    );
  }
}
