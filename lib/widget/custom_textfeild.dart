import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final TextEditingController controller;
  final int maxLine;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int? maxLength;
  final double? radius;
  final bool enabled;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? hintText;
  final TextAlign? textAlign;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final Color? hintTextColor;
  final VoidCallback? onTap;
  final Color? enableColor;
  final Color? focusedColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  CustomTextField({
    Key? key,
    this.onChanged,
    this.maxLine = 1,
    this.maxLength,
    this.radius,
    this.fillColor,
    this.isPassword = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.hintText,
    this.textAlign,
    this.prefix,
    this.suffix,
    this.onTap,
    this.enableColor,
    this.hintTextColor,
    this.focusedColor,
    this.cursorColor,
    required this.controller,
    this.contentPadding,
    this.prefixWidget,
    this.suffixWidget,
    this.validator,
    this.readOnly = false,
  }) : super(key: key);

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius ?? 4),
      color: Colors.black,
      child: ValueListenableBuilder(
        valueListenable: _isObscure,
        builder: (context, bool isObscure, _) {
          if (!isPassword) {
            isObscure = false;
          }
          return IntrinsicHeight(
            child: TextFormField(
              readOnly: readOnly,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
              onTap: onTap,
              obscureText: isObscure,
              obscuringCharacter: '*',
              onChanged: onChanged,
              controller: controller,
              maxLines: maxLine,
              maxLength: maxLength,
              keyboardType: keyboardType,
              focusNode: focusNode,
              validator: validator,
              cursorColor: cursorColor,
              textAlign: textAlign ?? TextAlign.start,
              enabled: enabled,
              decoration: InputDecoration(
                prefix: prefixWidget,
                suffix: suffixWidget,
                contentPadding: contentPadding,
                isDense: true,
                prefixIcon: prefix,
                // suffixIcon: suffix == null && isPassword
                //     ? GestureDetector(
                //         child: Transform.scale(
                //           scale: 0.5,
                //           child: SvgPicture.asset(
                //             isObscure ? IconsAsset.closeEyeIcon : IconsAsset.openEyeIcon,
                //           ),
                //         ),
                //         onTap: () {
                //           _isObscure.value = !isObscure;
                //         },
                //       )
                //     : suffix,
                counterText: "",
                // contentPadding: const EdgeInsets.all(12),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: hintTextColor ?? Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
                errorStyle: TextStyle(color: Colors.red),
                filled: true,
                fillColor: fillColor ?? Colors.black,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                  borderSide: BorderSide(color: enableColor ?? Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                  borderSide: BorderSide(color: focusedColor ?? Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius ?? 4),
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
