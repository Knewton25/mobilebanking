// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/font_style.dart';

import 'reset_password_screen.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({Key? key}) : super(key: key);

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      bottomNavigationBar: buttonView(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerView(),
            centerView(),
          ],
        ),
      ),
    );
  }

  Widget buttonView() {
    return commonButton(title: AppString.continues,onTap: (){
      Get.to(()=>ResetPasswordScreen());
    }).paddingAll(24);
  }

  Widget centerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: colorF9FAFB,
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Icon(
                Icons.check_circle,
                color: colorPrimary,
                size: 26,
              )),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.email,
                    style: fontBlack18W700,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    AppString.exEmail,
                    style: fontGray16W400,
                  ),
                ],
              ),
              Spacer(),
              Center(
                  child: Icon(
                Icons.email_outlined,
                color: colorGray,
              ))
            ],
          ),
        ),
      ],
    );
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: colorF9FAFB,
          ),
          padding: EdgeInsets.all(15),
          child: Image.asset("assets/images/userImage.png"),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppString.verifyYourIdentity,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(text: AppString.verifyText1, style: fontGray16W400.copyWith(height: 1.5), children: [
            TextSpan(
              text: AppString.verifyText2,
              style: fontRed16W700,
              children: [
                TextSpan(text: AppString.verifyText3, style: fontGray16W400.copyWith(height: 1.5)),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
