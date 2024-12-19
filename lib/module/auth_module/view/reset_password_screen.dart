// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:airpay/module/auth_module/view/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonView(),
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      body: SingleChildScrollView( physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerView(),
              textFieldView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonView() {
    return commonButton(
            onTap: () {
              Get.offAll(() => LoginScreen());
            },
            title: AppString.createNewPassword)
        .paddingAll(24);
  }

  Widget textFieldView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 34,
        ),
        commonTextField(
            isPassword: true,
            hintText: AppString.password,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/lock.png",
                height: 10,
                width: 10,
                fit: BoxFit.fill,
                color: color6B7280,
              ),
            )),
        SizedBox(
          height: 24,
        ),
        commonTextField(
            isPassword: true,
            hintText: AppString.confirmPassword,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/lock.png",
                height: 10,
                width: 10,
                fit: BoxFit.fill,
                color: color6B7280,
              ),
            )),
      ],
    );
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.createNewPassword,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppString.createPasswordDetails,
          style: fontGray16W400,
        ),
      ],
    );
  }
}
