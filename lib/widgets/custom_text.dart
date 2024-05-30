import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.textColor,
      this.textFontSize,
      this.textFontWeight});

  final String text;
  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
          color: widget.textColor ?? Colors.black87,
          fontSize: widget.textFontSize ?? 12,
          fontWeight: widget.textFontWeight ?? FontWeight.normal),
    );
  }
}
