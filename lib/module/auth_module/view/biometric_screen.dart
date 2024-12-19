// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/main_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:airpay/module/auth_module/controller/biometric_controller.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({Key? key}) : super(key: key);

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      bottomNavigationBar: buttonView(),
      appBar: commonAppBar(),
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            "assets/images/biobg.png",
            width: MediaQuery.of(context).size.width - 60,
            fit: BoxFit.fill,
          )),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerView(),
                fingerPrintView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonView() {
    return SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonButton(
              title: AppString.enableBiometricAccess,
              onTap: () {
                BioMetricController.to.authenticateWithBiometrics();
              }),
          SizedBox(
            height: 10,
          ),
          commonButton(
              title: AppString.iDoThisLater,
              buttonColor: Colors.transparent,
              textColor: colorSecondary,
              onTap: () {
                Get.offAll(() => MainScreen());
              }),
        ],
      ).paddingAll(24),
    );
  }

  Widget fingerPrintView() {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 450,
        child: Center(
            child: Image.asset(
          "assets/images/fingerPrintImage.png",
          height: 130,
        )));
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.enableBiometricAccess,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppString.loginQuicklyAndSecurely,
          style: fontGray16W400,
        ),
      ],
    );
  }
}
