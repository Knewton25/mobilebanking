// import 'package:awesome_card/awesome_card.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/add_card_module/view/qr_scnner_screen.dart';
import 'package:airpay/module/chart_module/chart_screen.dart';
import 'package:airpay/module/home_module/view/Transfers/transfer_screen.dart';
import 'package:airpay/module/profile_module/view/notification_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/credit_card/credit_card_brand.dart';
import 'package:airpay/uitily/credit_card/credit_card_widget.dart';
import 'package:airpay/uitily/credit_card/custom_card_type_icon.dart';
import 'package:airpay/uitily/credit_card/glassmorphism_config.dart';
import 'package:airpay/uitily/font_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBg,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            backgroundColor: colorBg,
            elevation: 0,
            centerTitle: false,
            toolbarHeight: 70,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hi Zeeshan!",
                      style: fontBlack12W400,
                    ),
                    Text(
                      AppString.welcomeBack,
                      style: fontBlack20W700,
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Get.to(() => NotificationScreen());
                      },
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: color6B7280)),
                        child: Icon(
                          Icons.notifications_none_sharp,
                          color: colorSecondary,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            headerView(),
            optionView(),
          ]),
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorF9FAFB),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(() => QrScannerScreen());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/profile_icons/money-recive.png', height: 30, width: 30),
                    SizedBox(height: 5),
                    Text(AppString.deposit, style: fontBlack14W600)
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => TransferScreen());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/profile_icons/refresh-circle.png', height: 30, width: 30),
                    SizedBox(height: 5),
                    Text(AppString.transfers, style: fontBlack14W600)
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset('assets/images/profile_icons/money-send.png', height: 30, width: 30),
                  SizedBox(height: 5),
                  Text(AppString.withdraw, style: fontBlack14W600)
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(() => ChartScreen());
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/element-plus.png', height: 30, width: 30),
                    SizedBox(height: 5),
                    Text(AppString.more, style: fontBlack14W600)
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppString.allTransactions, style: fontBlack16W600),
            Spacer(),
            Text(AppString.todaySep25, style: fontBlack16W600),
            Icon(Icons.arrow_forward_ios_rounded, size: 15, color: colorPrimary)
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 10),
        ListView.separated(
          itemCount: allTransactions.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Container(
                    height: 45,
                    width: 45,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: colorF9FAFB, borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(allTransactions[index].imagePath ?? "")),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(allTransactions[index].title ?? "", style: fontBlack16W600),
                    SizedBox(height: 5),
                    Text(allTransactions[index].description ?? "", style: fontGray14W400),
                  ],
                ),
                Spacer(),
                Text(allTransactions[index].payment ?? "",
                    style: fontBlack16W600.copyWith(color: (allTransactions[index].payment?[0]) == "-" ? colorFF3A46 : colorSecondary))
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 5);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider().paddingSymmetric(horizontal: 16);
          },
        )
      ],
    );
  }
}

/// model

class AllTransactions {
  String? title;
  String? description;
  String? payment;
  String? imagePath;

  AllTransactions({this.title, this.description, this.payment, this.imagePath});
}

List<AllTransactions> allTransactions = [
  AllTransactions(title: "Gym", description: "Payment", payment: "- \$55.0", imagePath: "assets/images/gym.png"),
  AllTransactions(title: "Bank of America", description: "Deposit", payment: "+ \$2541.0", imagePath: "assets/images/money-recive_2.png"),
  AllTransactions(title: "To Brody Zmymo", description: "Sent", payment: "- \$540.0", imagePath: "assets/images/send.png"),
];
