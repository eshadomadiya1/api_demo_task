import 'package:api_demo_task/clothes_ui/model/clothes_model.dart';
import 'package:api_demo_task/utils/app_string.dart';
import 'package:api_demo_task/utils/assets.dart';
import 'package:get/get.dart';

class ProductDataController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  List<String> productTypeList = [
    AppString.tShirt,
    AppString.cropTop,
    AppString.sleeveless,
    AppString.shirts,
  ];

  void fetchProducts() {
    var productList = [
      Product(
        title: AppString.pullover,
        brand: AppString.mango,
        price: AppString.fiftyOne,
        rating: 4,
        reviews: AppString.three,
        imageUrl: ImagesAsset.pullOverImage,
        isFavorite: false,
      ),
      Product(
        title: AppString.blouse,
        brand: AppString.dorothy,
        price: AppString.thirtyFour,
        rating: 4,
        reviews: AppString.zero,
        imageUrl: ImagesAsset.blouseImage,
        isFavorite: false,
      ),
      Product(
        title: AppString.tShirt,
        brand: AppString.lostInk,
        price: AppString.twelve,
        rating: 5,
        reviews: AppString.ten,
        imageUrl: ImagesAsset.tShirtImage,
        isFavorite: true,
      ),
      Product(
        title: AppString.shirts,
        brand: AppString.topShop,
        price: AppString.fiftyOne,
        rating: 5,
        reviews: AppString.three,
        imageUrl: ImagesAsset.shirtImage,
        isFavorite: true,
      ),
    ];

    products.assignAll(productList);
  }

  void toggleFavorite(int index) {
    var product = products[index];
    products[index] = Product(
      title: product.title,
      brand: product.brand,
      price: product.price,
      rating: product.rating,
      reviews: product.reviews,
      imageUrl: product.imageUrl,
      isFavorite: !product.isFavorite,
    );
  }

  void sortProductsByTitle(bool ascending) {
    products.sort((a, b) => ascending ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
  }

  void sortProductsByPrice(bool ascending) {
    products.sort((a, b) => ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price)
        // ? double.parse(a.price).compareTo(double.parse(b.price))
        // : double.parse(b.price).compareTo(double.parse(a.price))
        );
  }
}
