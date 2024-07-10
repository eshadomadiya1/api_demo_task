import 'package:api_demo_task/utils/navigation_utils/navigation.dart';
import 'package:api_demo_task/utils/navigation_utils/routes.dart';
import 'package:api_demo_task/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSplashScreen extends StatefulWidget {
  ProductSplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<ProductSplashScreen> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigation.pushNamed(Routes.productScreen);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 2),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: '🅱🅴🅰🆄🆃🆈 🅲🅰🆁🅴',
                        fontSize: 20,
                        color: Colors.pinkAccent.withOpacity(0.6),
                        fontWeight: FontWeight.w700,
                      ).paddingOnly(bottom: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Image.asset(
                            "assets/images/artist.png",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
           
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
