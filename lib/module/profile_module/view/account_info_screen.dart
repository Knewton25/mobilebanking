// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/profile_module/view/edit_account_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/font_style.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: AppString.accountInfo),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: commonButton(
          title: AppString.edit,
          buttonColor: colorF9FAFB,
          textColor: colorPrimary,
          onTap: () {
            Get.to(() => EditAccountScreen());
          },
        ),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              headerView(),
              SizedBox(height: 20),
              Text(AppString.personalInfo, style: fontGray16W600),
              SizedBox(height: 15),
              personalInfo(),
              SizedBox(height: 15),
              Text(AppString.contactInfo, style: fontGray16W600),
              SizedBox(height: 15),
              contactInfo()
            ],
          )),
    );
  }

  headerView() {
    return Center(
      child: SizedBox(
        height: 80,
        width: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100), child: Image.asset('assets/images/profile_icons/user_name.png', height: 80, width: 80)),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(border: Border.all(color: colorWhite), color: colorSecondary, borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.mode_edit_outlined, color: colorWhite, size: 15),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  personalInfo() {
    RxBool switchValue = true.obs;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: colorE5E7EB)),
      child: Column(children: [
        commonTextView(text1: AppString.yourName, text2: AppString.anantMandanka),
        commonTextView(text1: AppString.occupation, text2: AppString.students),
        commonTextView(text1: AppString.employer, text2: AppString.overlayDesign),
        commonTextView(
            text1: AppString.uSCitizen,
            endWidget: StreamBuilder(
                stream: switchValue.stream,
                builder: (context, snapshot) {
                  return Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        // This bool value toggles the switch.
                        value: switchValue.value,
                        activeColor: colorPrimary,
                        onChanged: (bool? value) {
                          // This is called when the user toggles the switch.
                          switchValue.value = value ?? false;
                        },
                      ));
                })),
      ]),
    );
  }

  contactInfo() {
    RxBool switchValue = true.obs;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: colorE5E7EB)),
      child: Column(children: [
        commonTextView(text1: AppString.phoneNumber, text2: AppString.number),
        commonTextView(text1: AppString.email, text2: AppString.anabelangellaGmailCom),
      ]),
    );
  }

  commonTextView({required String text1, String? text2, Widget? endWidget}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text1, style: fontGray16W600),
      endWidget ?? Text(text2 ?? "", style: fontBlack16W600),
    ]).paddingSymmetric(horizontal: 4, vertical: 8);
  }
}




