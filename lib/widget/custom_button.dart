import 'package:api_demo_task/widget/custom_loading_widget.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget {
  final double? height;
  final VoidCallback? onTap;
  final double? width;
  final double? fontSize;
  final FontWeight fontWeight;
  final String? text;
  final String? svg;
  final String? endSvg;
  final Color? buttonColor;
  final Color? disableButtonColor;
  final Color? buttonBorderColor;
  final Color? textColor;
  final Color? disableTextColor;
  final bool needBorderColor;
  final bool isDisabled;
  final bool isLoader;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const CustomButton({
    Key? key,
    this.height,
    this.width,
    this.text,
    this.svg,
    this.endSvg,
    this.buttonBorderColor,
    this.buttonColor,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
    this.textColor,
    this.onTap,
    this.padding,
    this.isDisabled = false,
    this.isLoader = false,
    this.disableButtonColor,
    this.disableTextColor,
    this.needBorderColor = true,
    this.borderRadius,
  }) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final buttonButton = (widget.isDisabled) ? widget.disableButtonColor ?? Colors.grey : widget.buttonColor ?? Colors.white;
    return GestureDetector(
      onTap: (widget.isLoader || widget.isDisabled) ? null : widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: widget.padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
          color: buttonButton,
          border: Border.all(
            color: (widget.needBorderColor) ? widget.buttonBorderColor ?? buttonButton : Colors.transparent,
          ),
        ),
        child:
        Center(
          child: widget.isLoader
              ? CustomLoadingWidget(size: 25)
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.svg != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          SizedBox(width: 8)
                        ],
                      ),
                    Text(
                      widget.text.toString(),
                      style: TextStyle(
                        // height: 1.2,
                        fontSize: widget.fontSize ?? 16,
                        fontWeight: widget.fontWeight,
                        color: widget.textColor ?? Colors.black,
                      ),
                    ),
                    if (widget.endSvg != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 8),

                        ],
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
