import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/country_piker/currency_picker.dart';
import 'package:airpay/uitily/country_piker/src/currency.dart';
import 'package:airpay/uitily/country_piker/src/extensions.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:airpay/module/auth_module/controller/country_controller.dart';

import 'set_password_screen.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonView(),
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [headerView(), countryView()],
        ),
      ),
    );
  }

  Widget buttonView() {
    return commonButton(
        title: AppString.continues,
        onTap: () {
          Get.to(() => const SetPasswordScreen());
        }).paddingAll(24);
  }

  Widget countryView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
        ),
        commonTextField(
            controller: CounterController.to.countryNameController,
            hintText: AppString.selectCountry,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: colorSecondary,
            ),
            prefixIcon: Text(
              CounterController.to.countryData == null ? "" : CurrencyUtils.currencyToEmoji(CounterController.to.countryData!),
              style: fontBlack16W600.copyWith(fontSize: 35),
            ).paddingOnly(left: 10, right: 10),
            onTap: () {
              showCurrencyPicker(
                context: context,
                showFlag: true,
                showCurrencyName: true,
                showCurrencyCode: true,
                onSelect: (Currency currency) {
                  print('Select currency: ${currency.name}');
                  CounterController.to.countryData = currency;
                  CounterController.to.countryNameController.text = currency.name;
                  setState(() {});
                },
              );
            }),
      ],
    );
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.countryOfResidence,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppString.pleaseSelectAllTheCountries,
          style: fontGray16W400,
        ),
      ],
    );
  }
}
