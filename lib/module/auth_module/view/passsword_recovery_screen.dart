import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';

import 'verify_Identity_screen.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      bottomNavigationBar: buttonView(),
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
    return commonButton(title: AppString.sendMeEmail,onTap: (){
      Get.to(()=>VerifyIdentityScreen());
    }).paddingAll(24);
  }

  Widget textFieldView() {
    return commonTextField(
        keyboardType: TextInputType.emailAddress,
        hintText: AppString.email,
        prefixIcon: Icon(
          Icons.email_outlined,
          color: color6B7280,
        )).paddingOnly(top: 32);
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
          child: Image.asset("assets/images/lockImage.png"),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppString.passwordRecovery,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppString.enterRegisteredEmailBelowReceivePasswordInstructions,
          style: fontGray16W400,
        ),
      ],
    );
  }
}
