import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../uitily/color_uitily.dart';
import '../../../uitily/common_app_bar.dart';
import '../../../uitily/font_style.dart';
import 'biometric_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: commonAppBar(),
      bottomNavigationBar: bottomView(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerView(),
            otpTextFormFeild(),
          ],
        ),
      ),
    );
  }

  Widget bottomView() {
    return commonButton(title: AppString.confirm,onTap: (){
      Get.to(()=>BiometricScreen());
    }).paddingAll(24);
  }

  Widget otpTextFormFeild() {
    return Column(
      children: [
        OTPTextField(
          length: 5,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 50,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.box,
          otpFieldStyle: OtpFieldStyle(
            enabledBorderColor: Colors.transparent,
            backgroundColor: colorF9FAFB,
            focusBorderColor: colorPrimary,
            borderColor: Colors.transparent,
          ),
          onCompleted: (pin) {
            print("Completed: " + pin);
          },
        ).paddingOnly(top: 35),
        SizedBox(height: 35,),
        Text(AppString.resendCode,style: fontRed16W700,)
      ],
    );
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.verifyItYou,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(text: AppString.otpDec1, style: fontGray16W400.copyWith(height: 1.5), children: [
            TextSpan(
              text: AppString.otpDec2,
              style: fontGray16W400.copyWith(color: colorSecondary, height: 1.5),
              children: [
                TextSpan(text: AppString.otpDec3, style: fontGray16W400.copyWith(height: 1.5)),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
