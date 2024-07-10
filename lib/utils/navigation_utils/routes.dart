
import 'package:api_demo_task/add_to_cart/view/shopping_page.dart';
import 'package:api_demo_task/audio_call/presentation/audio_call_screen.dart';
import 'package:api_demo_task/clothes_ui/presentation/clothes_detail_screen.dart';
import 'package:api_demo_task/clothes_ui/presentation/clothes_screen.dart';
import 'package:api_demo_task/clothing_fashion/user/authentication/login_screen.dart';
import 'package:api_demo_task/clothing_fashion/user/authentication/signup_screen.dart';
import 'package:api_demo_task/dictionary_api/view/dictionary_screen.dart';
import 'package:api_demo_task/food_app/view/home_screen.dart';
import 'package:api_demo_task/food_app/view/splash_screen.dart';
import 'package:api_demo_task/music_player/presentation/music_home_screen.dart';
import 'package:api_demo_task/music_player/presentation/music_player_screen.dart';
import 'package:api_demo_task/pagination_api/pagination_api/view/pagination_data_display.dart';
import 'package:api_demo_task/pokemon_api/presentation/pokemon_screen.dart';
import 'package:api_demo_task/product_api/view/product_screen.dart';
import 'package:api_demo_task/product_api/view/product_splash_screen.dart';
import 'package:api_demo_task/product_api/view/setting_screen.dart';
import 'package:api_demo_task/recipes_food/view/foodie_detail_screen.dart';
import 'package:api_demo_task/recipes_food/view/foodie_like_screen.dart';
import 'package:api_demo_task/recipes_food/view/foodie_screen.dart';
import 'package:api_demo_task/record_video/view/created_show_video.dart';
import 'package:api_demo_task/record_video/view/video_record_screen.dart';
import 'package:api_demo_task/user_api/presentation/user_api_screen.dart';
import 'package:api_demo_task/user_api/presentation/user_detail_screen.dart';
import 'package:get/get.dart';


mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const noTransition = Transition.noTransition;

  // get started
  static const String userDetailScreen = '/userDetailScreen';
  static const String userApiScreen = '/userApiScreen';
  static const String paginationDataDisplay = '/paginationDataDisplay';
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String productScreen = '/productScreen';
  static const String productSplashScreen = '/productSplashScreen';
  static const String foodieScreen = '/foodieScreen';
  static const String foodieDetailScreen = '/foodieDetailScreen';
  static const String foodieLikeScreen = '/foodieLikeScreen';
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String dictionaryScreen = '/dictionaryScreen';
  static const String settingScreen = '/settingScreen';
  static const String shoppingPage = '/shoppingPage';
  static const String pokemonScreen = '/pokemonScreen';
  static const String clothesDataScreen = '/clothesDataScreen';
  static const String clothesDetailScreen = '/clothesDetailScreen';
  static const String musicPlayerScreen = '/musicPlayerScreen';
  static const String musicHomeScreen = '/musicHomeScreen';
  // static const String audioHomePage = '/audioHomePage';
  static const String createdVideoPlayScreen = '/createdVideoPlayScreen';
  static const String createReels = '/createReels';

  static List<GetPage<dynamic>> pages = [

    GetPage<dynamic>(
      name: userDetailScreen,
      page: () => UserDetailScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: userApiScreen,
      page: () => UserApiScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: paginationDataDisplay,
      page: () => PaginationDataDisplay(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: productScreen,
      page: () => ProductScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: productSplashScreen,
      page: () => ProductSplashScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: foodieScreen,
      page: () => FoodieScreen(),
      transition: defaultTransition,
    ),

    GetPage<dynamic>(
      name: foodieDetailScreen,
      page: () => FoodieDetailScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: foodieLikeScreen,
      page: () => FoodieLikeScreen(),
      transition: defaultTransition,
    ),

    GetPage<dynamic>(
      name: loginScreen,
      page: () =>LoginScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: signUpScreen,
      page: () =>SignUpScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: dictionaryScreen,
      page: () =>DictionaryScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: settingScreen,
      page: () =>SettingScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: shoppingPage,
      page: () =>  ShoppingPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: pokemonScreen,
      page: () =>  PokemonScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: clothesDataScreen,
      page: () => ProductDataScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name:clothesDetailScreen,
      page: () =>ClothesDetailScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name:musicPlayerScreen,
      page: () =>MusicPlayerScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name:musicHomeScreen,
      page: () =>MusicHomeScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name:createdVideoPlayScreen,
      page: () =>CreatedVideoPlayScreen(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name:createReels,
      page: () =>CreateReels(),
      transition: defaultTransition,
    ),

  ];
}
