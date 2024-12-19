import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/main_screen.dart';
import 'package:airpay/module/profile_module/view/account_info_screen.dart';
import 'package:airpay/module/profile_module/view/change_password_screen.dart';
import 'package:airpay/module/profile_module/view/contacts_screen.dart';
import 'package:airpay/module/profile_module/view/general_setting_screen.dart';
import 'package:airpay/module/profile_module/view/referral_code_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/font_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(
          title: AppString.profile,
          leading: InkWell(
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              selectedIndex.value = 0;
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
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              headerView(),
              const SizedBox(height: 25),
              commonProfileView(
                  title: 'Referral Code',
                  image: 'assets/images/profile_icons/referral_code.png',
                  onTap: () {
                    Get.to(() => const ReferralCodeScreen());
                  }),
              commonProfileView(
                  title: 'Account Info',
                  image: 'assets/images/profile_icons/account_info.png',
                  onTap: () {
                    Get.to(() => const AccountInfoScreen());
                  }),
              commonProfileView(
                  title: 'Contact List',
                  image: 'assets/images/profile_icons/contact_list.png',
                  onTap: () {
                    Get.to(() => const ContactsScreen());
                  }),
              // commonProfileView(title: 'Language', image: 'assets/images/profile_icons/language.png'),
              const Divider(),
              commonProfileView(
                  title: 'General Setting',
                  image: 'assets/images/profile_icons/settings.png',
                  onTap: () {
                    Get.to(() => const GeneralSettingScreen());
                  }),
              commonProfileView(
                  title: 'Change Password',
                  image: 'assets/images/profile_icons/lock.png',
                  onTap: () {
                    Get.to(() => const ChangePasswordScreen());
                  }),
            ],
          )),
    );
  }

  headerView() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/images/profile_icons/pattern.png', height: 90),
            Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100), child: Image.asset('assets/images/profile_icons/user_name.png', height: 80, width: 80)),
            ).paddingOnly(top: 30)
          ],
        ),
        Text('Rose Angela', style: fontBlack22W600),
        Text('abcd.abcde@mail.com', style: fontGray14W400),
      ],
    );
  }

  commonProfileView({required String image, required String title, Function()? onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap ?? () {},
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
      ).paddingAll(5),
    );
  }
}
