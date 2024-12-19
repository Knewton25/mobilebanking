// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/font_style.dart';

class TransferSuccessfulScreen extends StatefulWidget {
  const TransferSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<TransferSuccessfulScreen> createState() => _TransferSuccessfulScreenState();
}

class _TransferSuccessfulScreenState extends State<TransferSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(),
      bottomNavigationBar: Padding(padding: EdgeInsets.all(8), child: commonButton(title: AppString.backToHome)),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(child: Image.asset("assets/images/profile_icons/transfer_successful.png", height: 200)),
              SizedBox(height: 30),
              Text(AppString.transferSuccessful, style: fontBlack22W600),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:
                    Text(AppString.transfersAreReviewedWhichMayResultInDelaysOrFundsBeingFrozen, textAlign: TextAlign.center, style: fontGray14W400),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorF9FAFB),
                child: Text("\$924.02", style: fontBlack22W600),
              )
            ],
          )),
    );
  }
}
