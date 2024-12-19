import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';

class ReferralCodeScreen extends StatefulWidget {
  const ReferralCodeScreen({Key? key}) : super(key: key);

  @override
  State<ReferralCodeScreen> createState() => _ReferralCodeScreenState();
}

class _ReferralCodeScreenState extends State<ReferralCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      body: SingleChildScrollView( physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(child: Image.asset("assets/images/profile_icons/ReferralCode.png", height: 230)),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Here’s \$18 ',
                  style: fontBlack22W600,
                  children: [
                    TextSpan(text: 'free', style: fontBlack22W600.copyWith(color: colorPrimary)),
                    TextSpan(text: ' on us!', style: fontBlack22W600),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(AppString.shareYouReferralLinkAndEarn15, style: fontGray16W600),
              const SizedBox(height: 20),
              commonTextField(
                  hintText: "FGX4456R",
                  prefixIcon: Icon(Icons.copy, color: colorGray),
                  suffixIcon: InkWell(onTap: () {}, child: Text("Share", style: fontRed16W500).paddingAll(10))),
              const Divider(height: 100),
              RichText(
                text: TextSpan(
                  text: 'Get \$5 ',
                  style: fontBlack22W600,
                  children: [
                    TextSpan(text: 'free', style: fontBlack22W600.copyWith(color: colorPrimary)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(AppString.forAnyAccountYouConnects, style: fontGray16W400),
              const SizedBox(height: 30),
            ],
          )),
    );
  }
}
