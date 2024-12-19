import 'package:flutter/material.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';

class FNQScreen extends StatefulWidget {
  const FNQScreen({Key? key}) : super(key: key);

  @override
  State<FNQScreen> createState() => _FNQScreenState();
}

class _FNQScreenState extends State<FNQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: commonButton(title: AppString.learnMore, buttonColor: colorF9FAFB,
          textColor: colorPrimary,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(AppString.youHaveAnyQuestion, style: fontBlack24W700),
          const SizedBox(height: 10),
          commonTextField(hintText: AppString.search, prefixIcon: const Icon(Icons.search)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.frequentlyAsked, style: fontBlack16W600),
              Text(AppString.viewAll, style: fontRed16W700),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(border: Border.all(color: colorGray.withOpacity(0.6)), borderRadius: BorderRadius.circular(8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                AppString.howDoICreateASmartPayAccount,
                style: fontBlack16W600,
              ),
              const SizedBox(height: 7),
              Text(
                AppString.youCanCreateASmartpayAccountByDownloadAndOpenTheSmartpayApplication,
                style: fontGray14W400,
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(border: Border.all(color: colorGray.withOpacity(0.6)), borderRadius: BorderRadius.circular(8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                AppString.howToCreateACardForSmartpay,
                style: fontBlack16W600,
              ),
              const SizedBox(height: 7),
              Text(
                AppString.youCanSelectTheCreateCardMenuThenSelect,
                style: fontGray14W400,
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(border: Border.all(color: colorGray.withOpacity(0.6)), borderRadius: BorderRadius.circular(8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(
                AppString.howToTopUpOnSmartpay,
                style: fontBlack16W600,
              ),
              const SizedBox(height: 7),
              Text(
                AppString.clickTheTopUpMenuThenSelectTheAmountOfMoney,
                style: fontGray14W400,
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
