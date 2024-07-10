import 'package:api_demo_task/add_to_cart/contoller/cart_controller.dart';
import 'package:api_demo_task/add_to_cart/contoller/shopping_controller.dart';
import 'package:api_demo_task/add_to_cart/view/shopping_detail.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ShoppingDetail();
                          },));
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              '${controller.products[index].productImage}',
                                              fit: BoxFit.cover,
                                              height: 70,
                                              width: 70,
                                            ).paddingOnly(right: 10),
                                            Text(
                                              '${controller.products[index].productName}',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                          ],
                                        ).paddingOnly(bottom: 10),
                                        CommonText(
                                          text: '${controller.products[index].productDescription}',
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    Text('\$${controller.products[index].price}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                     cartController.addToCart(controller.products[index]);

                                  },
                                  // color: Colors.blue,
                                  // textColor: Colors.white,
                                  child: CommonText(
                                    text: 'Add to Cart',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                // Obx(() => IconButton(
                                //       icon: controller.products[index].isFavorite.value
                                //           ? Icon(Icons.check_box_rounded)
                                //           : Icon(Icons.check_box_outline_blank_outlined),
                                //       onPressed: () {
                                //         controller.products[index].isFavorite.toggle();
                                //       },
                                //     ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Row(
                children: [
                  Card(
                    child: Text(
                      'Total amount: \$ ${controller.totalPrice}',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
                    ).paddingSymmetric(horizontal: 10, vertical: 5),
                  ),
                ],
              ).paddingOnly(left: 10);
            }),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}
