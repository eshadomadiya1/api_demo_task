import 'package:api_demo_task/product_api/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'utils/navigation_utils/routes.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      title: 'Goal App',
      // theme: ThemeData.light(),
      themeMode: ThemeController.to.themeMode,
      // initialRoute: Routes.productSplashScreen,
      initialRoute: Routes.createReels,
      // initialRoute: Routes.audioHomePage,
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
    );
  }
}
