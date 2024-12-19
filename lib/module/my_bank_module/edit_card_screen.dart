// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/auth_module/controller/country_controller.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/country_piker/currency_picker.dart';
import 'package:airpay/uitily/credit_card/credit_card_brand.dart';
import 'package:airpay/uitily/credit_card/flutter_credit_card.dart';

import '../../uitily/font_style.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({Key? key}) : super(key: key);

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: AppString.editCard),
      backgroundColor: colorBg,
      body: Column(
        children: [creditCard(), tabBar()],
      ),
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

  tabBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: colorF9FAFB,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TabBar(
            controller: _tabController,
            // give the indicator a decoration (color and border radius)
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: colorWhite, boxShadow: [
              BoxShadow(color: colorGray.withOpacity(0.2), blurRadius: 5.0),
            ]),
            labelColor: colorSecondary,
            unselectedLabelColor: colorGray,
            tabs: const [
              Tab(text: 'Manage'),
              Tab(text: 'Detail'),
            ],
          ).paddingAll(5),
        ),
        // tab bar view here
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 284,
          child: TabBarView(
            controller: _tabController,
            children: [
              ///
              ListView.separated(
                itemCount: allTransactions.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  RxBool switchValue = true.obs;
                  return Row(
                    children: [
                      Container(
                          height: 45,
                          width: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: colorF9FAFB, borderRadius: BorderRadius.circular(12)),
                          child: Image.asset(allTransactions[index].imagePath ?? "")),
                      SizedBox(width: 15),
                      Expanded(child: Text(allTransactions[index].title ?? "", style: fontBlack16W600)),
                      StreamBuilder(
                          stream: switchValue.stream,
                          builder: (context, snapshot) {
                            return Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  value: switchValue.value,
                                  activeColor: colorPrimary,
                                  onChanged: (bool? value) {
                                    switchValue.value = value ?? false;
                                  },
                                ));
                          })
                    ],
                  ).paddingSymmetric(vertical: 5);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),

              ///
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.cardDetail,
                      style: fontBlack18W600,
                    ),
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.white,
                      cardNumberDecoration: InputDecoration(
                        hintText: AppString.cardNumber,
                        filled: true,
                        fillColor: colorF9FAFB,
                        hintStyle: fontGray16W400,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary), borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(16)),
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: fontGray16W400,
                        filled: true,
                        fillColor: colorF9FAFB,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary), borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(16)),
                        hintText: AppString.expiryDate,
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: fontGray16W400,
                        filled: true,
                        fillColor: colorF9FAFB,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary), borderRadius: BorderRadius.circular(16)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(16)),
                        hintText: AppString.vCC,
                      ),
                      cardHolderDecoration: InputDecoration(
                          hintStyle: fontGray16W400,
                          filled: true,
                          fillColor: colorF9FAFB,
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: colorPrimary), borderRadius: BorderRadius.circular(16)),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(16)),
                          hintText: AppString.cardHolder),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: commonTextField(
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
                                debugPrint('Select currency: ${currency.name}');
                                CounterController.to.countryData = currency;
                                CounterController.to.countryNameController.text = currency.name;
                                setState(() {});
                              },
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                    commonButton(
                        title: AppString.save,
                        onTap: () {
                          showDialog<String>(
                            barrierColor: Colors.transparent,
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
                                          Center(child: Text(AppString.greatYourCardIsReady, textAlign: TextAlign.center, style: fontBlack18W600)),
                                          SizedBox(height: 10),
                                          Center(
                                              child: Text(AppString.nowYouCanShopTransmitAndTransferConveniently,
                                                  textAlign: TextAlign.center, style: fontGray14W400)),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: commonButton(title: AppString.done),
                                          )
                                        ],
                                      )
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                          if (formKey.currentState!.validate()) {
                            debugPrint('valid!');
                          } else {
                            debugPrint('invalid!');
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
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
