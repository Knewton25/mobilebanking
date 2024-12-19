// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import 'proof_of_residency_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
            pinCodeTextFieldView(),
          ],
        ),
      ),
    );
  }

  Widget buttonView() {
    return commonButton(
        title: AppString.createPinCode,
        onTap: () {
          Get.to(() => ProofOfResidency());
        }).paddingAll(24);
  }

  Widget pinCodeTextFieldView() {
    return OTPTextField(
      length: 5,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 50,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      obscureText: true,
      otpFieldStyle: OtpFieldStyle(
        enabledBorderColor: colorPrimary,
        // backgroundColor: colorF9FAFB,
        focusBorderColor: colorPrimary,
        borderColor: colorPrimary,
      ),
      onCompleted: (pin) {
        if (kDebugMode) {
          print("Completed: $pin");
        }
      },
    ).paddingOnly(top: 10);
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.setYourPINCode,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppString.pinCodeSubTitle,
          style: fontGray16W400,
        ),
      ],
    );
  }
}
