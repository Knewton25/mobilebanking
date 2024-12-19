import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/font_style.dart';

Widget commonTextField(
    {String? hintText,
    String? title,
    bool isTitle = false,
    double? height,
    Widget? prefixIcon,
    Widget? suffixIcon,
    InputBorder? border,
    Function()? onTap,
    TextInputType? keyboardType,
    bool isPassword = false,
    TextEditingController? controller,
    Color? fillColor,
    Color? colorBorderSide,
    int? maxLines}) {
  RxBool visibil = true.obs;
  return StreamBuilder(
      stream: visibil.stream,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isTitle) Text(title ?? '', style: fontBlack16W600),
            if (isTitle) const SizedBox(height: 10),
            TextFormField(
              onTap: onTap ?? () {},
              keyboardType: keyboardType,
              controller: controller,
              obscureText: isPassword == true ? visibil.value : false,
              cursorColor: colorPrimary,
              cursorWidth: 1,
              maxLines: maxLines ?? 1,
              style: fontBlack16W600,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: colorBorderSide ?? color2FA2B9, width: 0),
                      gapPadding: 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: colorBorderSide ?? Colors.transparent, width: 0),
                      gapPadding: 0),
                  prefixIcon: prefixIcon,
                  fillColor: fillColor ?? colorF9FAFB,
                  filled: true,
                  suffixIcon: suffixIcon ??
                      (!isPassword
                          ? null
                          : StreamBuilder<Object>(
                              stream: visibil.stream,
                              builder: (context, snapshot) {
                                return InkWell(
                                    onTap: () {
                                      visibil.value = !visibil.value;
                                    },
                                    child: Image.asset(
                                      !visibil.value ? "assets/images/textVisibal.png" : "assets/images/textVisibal.png",
                                      scale: 3.5,
                                    ));
                              })),
                  hintText: hintText ?? "",
                  hintStyle: fontGray16W400),
            ),
          ],
        );
      });
}
