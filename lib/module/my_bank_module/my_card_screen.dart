import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/main_screen.dart';
import 'package:airpay/module/my_bank_module/edit_card_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/credit_card/credit_card_brand.dart';
import 'package:airpay/uitily/credit_card/flutter_credit_card.dart';

class MyCardScreen extends StatefulWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  State<MyCardScreen> createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: AppString.myCard,
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
      backgroundColor: colorBg,
      body: SingleChildScrollView(
          // padding: const EdgeInsets.all(16),
          child: Column(
        children: [
          creditCard(),
          creditCard(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: commonButton(
              title: AppString.addNewCard,
              buttonColor: colorF9FAFB,
              textColor: colorSecondary,
              onTap: () {
                Get.to(() => const EditCardScreen());
              },
            ),
          )
        ],
      )),
    );
  }

  creditCard() {
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
}
