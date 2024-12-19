import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/font_style.dart';

Widget commonButton(
    {double? height, double? width, double? borderRadius, Color? buttonColor, String? title, TextStyle? style, Color? textColor, Function()? onTap}) {
  return InkWell(
    borderRadius: BorderRadius.circular(borderRadius ?? 16),
    onTap: onTap ?? () {},
    child: Container(
      height: height ?? 55,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        color: buttonColor ?? colorPrimary,
      ),
      child: Center(
          child: Text(
        title ?? "",
        style: style ?? fontWhite14W400.copyWith(color: textColor ?? colorWhite),
      )),
    ),
  );
}
