import 'package:api_demo_task/widget/common_text.dart';
import 'package:api_demo_task/widget/custom_textfeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class DetailsWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? readOnly;
  final Key? keys;
  final bool showLine;
  final Color? lableColor;
  final bool isPassword;
  final String? svgImage;
  final Color? fillColor;
  final Widget? prefixWidget;
  final Widget? prefix;

  const DetailsWidget({
    Key? key,
    required this.labelText,
    required this.controller,
     this.hintText,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.readOnly,
    this.keys,
    this.showLine = false,
    this.isPassword = false,
    this.svgImage,
    this.fillColor,
    this.prefixWidget,
    this.prefix,
    this.lableColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(text: labelText,color: lableColor,),
        CustomTextField(
          fillColor: fillColor,
          controller: controller,
          hintText: hintText,
          suffix: suffixIcon,
          validator: validator,
          keyboardType: keyboardType ?? TextInputType.text,
          onTap: onTap,
          isPassword: isPassword,
          prefixWidget: prefixWidget,
          prefix: showLine
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // if (svgImage != null) SvgPicture.asset(svgImage!).paddingSymmetric(horizontal: 10.w),
                    Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      height: 18,
                      width: 1,
                      color: Colors.grey,
                    ).paddingOnly(right: 10)
                  ],
                )
              : prefix,
          readOnly: readOnly ?? false,
        ).paddingOnly(top: 8, bottom: 12),
      ],
    );
  }
}
