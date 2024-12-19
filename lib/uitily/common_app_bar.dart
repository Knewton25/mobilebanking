import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/font_style.dart';

/// common AppBar

PreferredSizeWidget commonAppBar({
  Widget? leading,
  Function()? backOnTap,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: colorWhite,
    elevation: 0,
    leadingWidth: 74,
    centerTitle: true,
    actions: actions,
    title: Text(
      title ?? "",
      style: fontBlack18W600,
    ),
    leading: Row(
      children: [
        leading ??
            InkWell(
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: backOnTap ??
                  () {
                    Get.back();
                  },
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 5, left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorE5E7EB),
                ),
                child: Icon(Icons.arrow_back_ios_new_outlined, color: colorSecondary, size: 20),
              ),
            ),
      ],
    ),
  );
}
