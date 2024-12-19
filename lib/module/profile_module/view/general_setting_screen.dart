// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/profile_module/view/notification_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/font_style.dart';

class GeneralSettingScreen extends StatefulWidget {
  const GeneralSettingScreen({Key? key}) : super(key: key);

  @override
  State<GeneralSettingScreen> createState() => _GeneralSettingScreenState();
}

class _GeneralSettingScreenState extends State<GeneralSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: AppString.generalSetting),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            commonProfileView0(
                title: AppString.defaultNotificationActions,
                image: 'assets/images/profile_icons/Alert.png',
                onTap: () {
                  Get.to(() => NotificationScreen());
                }),
            const Divider(height: 30),
            commonProfileView1(title: AppString.defaultNotificationActions, hint: AppString.youWantToReceiveBillRemindersBeforeABillIsDue),
            SizedBox(height: 10),
            commonProfileView1(title: AppString.billsCalendar, hint: AppString.youWantToReceiveBillReminderEmailsBeforeABill),
            SizedBox(height: 10),
            commonProfileView1(title: AppString.creditScoreCalendar, hint: AppString.youWantToSyncCreditScoreRemindersTouYourDeviceCale),
          ],
        ),
      ),
    );
  }

  commonProfileView0({required String image, required String title, Function()? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorF9FAFB),
                child: Image.asset(image, height: 25)),
            const SizedBox(width: 10),
            Expanded(child: Text(title, style: fontBlack16W600)),
            Icon(Icons.arrow_forward_ios_rounded, color: colorGray, size: 15)
          ],
        ),
      ),
    );
  }

  commonProfileView1({
    required String title,
    required String hint,
  }) {
    RxBool switchValue = true.obs;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: fontBlack16W600),
              const SizedBox(height: 10),
              Text(hint, style: fontGray14W400),
            ],
          ),
        ),
        StreamBuilder(
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
            })
      ],
    );
  }
}
