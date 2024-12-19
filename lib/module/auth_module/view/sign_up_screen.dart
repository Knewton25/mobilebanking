// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:airpay/module/auth_module/view/country_screen.dart';
import 'package:airpay/module/auth_module/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      bottomNavigationBar: SizedBox(height: 150, child: bottomView()),
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

  Widget textFieldView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
        ),
        commonTextField(
            hintText: AppString.fullName,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/userImage2.png",
                height: 10,
                width: 10,
                fit: BoxFit.fill,
                color: color6B7280,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        commonTextField(
            keyboardType: TextInputType.emailAddress,
            hintText: AppString.email,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: color6B7280,
            )),
        SizedBox(
          height: 20,
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
      ],
    );
  }

  Widget bottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonButton(
            title: AppString.signUp,
            onTap: () {
              Get.to(() => CountryScreen());
            }),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.alreadyHaveAnAccount,
              style: fontGray16W400,
            ),
            SizedBox(
              width: 4,
            ),
            InkWell(
                onTap: () {
                  Get.offAll(()=>LoginScreen());
                },
                child: Text(
                  AppString.signIn,
                  style: fontRed16W500,
                )),
          ],
        )
      ],
    ).paddingAll(24);
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.createA,
              style: fontBlack24W700,
            ),
            Text(
              AppString.joyPay,
              style: fontBlack24W700.copyWith(color: colorPrimary),
            ),
          ],
        ),
        Text(
          AppString.account,
          style: fontBlack24W700,
        ),
      ],
    );
  }
}
