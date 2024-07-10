import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showSnackBarAtTop({
    required String message,
    String? title,
    Color? color,
  }) {
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 10),
      borderRadius: 8,
      snackStyle: SnackStyle.FLOATING,
      // padding: EdgeInsets.symmetric(vertical: 12.h),
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          InkWell(
            onTap: Get.back,
            child: const Icon(Icons.close, color: Colors.white, size: 16),
          )
        ],
      ),
      titleText: Container(),
      // backgroundColor: title?.toLowerCase() == "error"
      //     ? Colors.redAccent
      //     : title?.toLowerCase() == "success"
      //     ? Colors.red
      //     : Colors.black45,
      backgroundColor: color??Colors.red,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 2),
      colorText: Colors.white,
      // isDismissible: false,
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 6),
    );
  }
}
