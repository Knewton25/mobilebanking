// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:airpay/module/add_card_module/view/qr_scnner_screen.dart';
import 'package:airpay/module/auth_module/controller/country_controller.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/country_piker/src/currency_utils.dart';
import 'package:airpay/uitily/font_style.dart';

class ProofOfResidency extends StatefulWidget {
  const ProofOfResidency({Key? key}) : super(key: key);

  @override
  State<ProofOfResidency> createState() => _ProofOfResidencyState();
}

class _ProofOfResidencyState extends State<ProofOfResidency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      body: SingleChildScrollView( physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerView(),
              countryMethodView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget countryMethodView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          AppString.nationality,
          style: font6B728014W900.copyWith(letterSpacing: 0.3),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: colorF9FAFB, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  CounterController.to.countryData == null ? "" : CurrencyUtils.currencyToEmoji(CounterController.to.countryData!),
                  style: fontBlack16W600.copyWith(fontSize: 35),
                ).paddingOnly(left: 16, right: 16),
                Text(
                  CounterController.to.countryData?.name ?? "Country",
                  style: fontBlack16W600.copyWith(fontWeight: FontWeight.w700),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppString.change,
                    style: fontRed16W700.copyWith(fontSize: 14),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          AppString.methodOfVerification,
          style: font6B728014W900.copyWith(letterSpacing: 0.3),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colorWhite,
            border: Border.all(
              color: colorF3F4F6,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              commonRowWidget(
                  title: AppString.passport,
                  onTap: () {
                    Get.to(() => QrScannerScreen());
                  },
                  image: "assets/images/passportImage.png"),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              commonRowWidget(title: AppString.identityCard, onTap: () {}, image: "assets/images/identityImage.png"),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              commonRowWidget(title: AppString.digitalDocument, onTap: () {}, image: "assets/images/digitalImage.png"),
            ],
          ),
        )
      ],
    );
  }

  Widget commonRowWidget({Function()? onTap, String? image, String? title}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image ?? "",
            height: 50,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title ?? "",
            style: fontBlack16W600.copyWith(fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.proofOfResidency,
          style: fontBlack24W700,
        ),
        const SizedBox(height: 8),
        Text(
          AppString.proveYouLiveInUnitedStates,
          style: fontGray16W400,
        ),
      ],
    );
  }
}
