// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:airpay/module/home_module/view/Transfers/transfer_successful_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/credit_card/credit_card_brand.dart';
import 'package:airpay/uitily/credit_card/credit_card_widget.dart';
import 'package:airpay/uitily/credit_card/custom_card_type_icon.dart';
import 'package:airpay/uitily/font_style.dart';

import '../../../../uitily/credit_card/glassmorphism_config.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: AppString.transfer),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: commonButton(
            title: AppString.done,
            onTap: () {
              transferConfirmation();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [headerView(), optionView()],
        ),
      ),
    );
  }

  headerView() {
    return CreditCardWidget(
      height: 220,
      width: MediaQuery.of(context).size.width,
      glassmorphismConfig: false ? Glassmorphism.defaultConfig() : null,
      cardNumber: "cardNumber",
      expiryDate: "expiryDate",
      cardHolderName: "cardHolderName",
      cardType: CardType.otherBrand,
      cvvCode: "cvvCode",
      bankName: 'Axis Bank',
      showBackView: false,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: true,
      cardBgColor: Colors.black,
      backgroundImage: 'assets/images/BG.png',
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            'assets/images/BG.png',
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }

  optionView() {
    RxInt selectedIndex = 0.obs;
    return Column(
      children: [
        StreamBuilder(
            stream: selectedIndex.stream,
            builder: (context, snapshot) {
              return SizedBox(
                height: 190,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: transfer.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        selectedIndex.value = index;
                      },
                      child: Container(
                        height: 190,
                        width: 130,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: selectedIndex.value == index ? null : Border.all(color: Colors.black.withOpacity(0.1)),
                            boxShadow: selectedIndex.value == index ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10.0)] : [],
                            borderRadius: BorderRadius.circular(12),
                            color: colorBg),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(transfer[index].imagePath ?? "", height: 65, width: 65),
                                ),
                                SizedBox(height: 15),
                                Text(transfer[index].title ?? "", style: fontBlack14W600, textAlign: TextAlign.center)
                              ],
                            ),
                            if (selectedIndex.value == index)
                              Positioned(
                                  right: 0,
                                  child: Icon(
                                    Icons.done,
                                    color: colorPrimary,
                                    size: 20,
                                  ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: EdgeInsets.all(14),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black.withOpacity(0.1)), borderRadius: BorderRadius.circular(12), color: colorBg),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(AppString.enterAmount, style: fontGray14W400), Text(AppString.max1535800, style: fontGray14W400)],
            ),
            SizedBox(height: 5),
            commonTextField(
                fillColor: colorWhite,
                colorBorderSide: Colors.transparent,
                keyboardType: TextInputType.phone,
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: colorF9FAFB),
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text(AppString.USD, style: fontGray16W600), Icon(Icons.keyboard_arrow_down, color: colorGray)]),
                ))
          ]),
        )
      ],
    );
  }

  transferConfirmation() {
    return showDialog<String>(
      // barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                Image.asset(
                  "assets/images/pop_up.png",
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 140),
                    Center(child: Text(AppString.transferConfirmation, textAlign: TextAlign.center, style: fontBlack18W600)),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text(AppString.from, style: fontGray14W400), Text(AppString.bankOfAmerica, style: fontGray14W400)])
                              .paddingSymmetric(horizontal: 14),
                          SizedBox(height: 10),
                          Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text(AppString.anabella, style: fontBlack16W600), Text("**** 1990", style: fontBlack16W600)])
                              .paddingSymmetric(horizontal: 14),
                          Divider(height: 20),
                          Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text(AppString.to, style: fontGray14W400), Text(AppString.citibankOnline, style: fontGray14W400)])
                              .paddingSymmetric(horizontal: 14),
                          SizedBox(height: 10),
                          Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text(AppString.maria, style: fontBlack16W600), Text("**** 7777", style: fontBlack16W600)])
                              .paddingSymmetric(horizontal: 14),
                          Divider(height: 20),
                          Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text(AppString.total, style: fontBlack16W600), Text("\$924.02", style: fontBlack16W600)])
                              .paddingSymmetric(horizontal: 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: commonButton(
                                title: AppString.sendNow,
                                onTap: () {
                                  Get.to(() => TransferSuccessfulScreen());
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

/// model

class Transfer {
  String? title;
  String? description;
  String? imagePath;

  Transfer({this.title, this.description, this.imagePath});
}

List<Transfer> transfer = [
  Transfer(title: "Maria Sevchenko", description: "", imagePath: "assets/images/profile_icons/user_name.png"),
  Transfer(title: "Jonny Andrade", description: "", imagePath: "assets/images/profile_icons/user_name_1.png"),
  Transfer(title: "Michella Princess Anna", description: "", imagePath: "assets/images/profile_icons/user_name_2.png"),
];
