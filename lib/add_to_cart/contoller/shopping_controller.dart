import 'package:api_demo_task/add_to_cart/model/product.dart';
import 'package:get/state_manager.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'assets/images/cream.jpg',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'assets/images/hair_wash.jpg',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.50,
          productDescription: 'some description about product',
          productImage: 'assets/images/shampoo.jpg',
          productName: 'ThirdProd'),
      Product(
          id: 4,
          price: 65,
          productDescription: 'some description about product',
          productImage: 'assets/images/hair_wash.jpg',
          productName: 'fourthProd'),
    ];

    products.value = productResult;
  }
}