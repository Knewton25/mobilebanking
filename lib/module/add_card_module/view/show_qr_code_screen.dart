// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/add_card_module/view/add_card_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';

class ShowQrCodeScreen extends StatefulWidget {
  const ShowQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ShowQrCodeScreen> createState() => _ShowQrCodeScreenState();
}

class _ShowQrCodeScreenState extends State<ShowQrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: AppString.showQrCode, actions: [
        GestureDetector(
          onTap: () {
            Get.to(()=>AddCardScreen());
          },
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorWhite.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorGray.withOpacity(0.6)),
            ),
            child: Center(
                child: Image.asset(
              "assets/images/dotsImage.png",
              height: 30,
              color: colorSecondary,
            )),
          ),
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .15),
            showQrCodeView(),
            // SizedBox(height: 20),
            Spacer(),
            bottomView(),


          ],
        ),
      ),
    );
  }

 Widget bottomView(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(Icons.error_outline_outlined,size: 25,color: colorPrimary,),
          SizedBox(height: 30,),
          Text(AppString.qrScreenDec,textAlign: TextAlign.center,),
          SizedBox(height: 30,),
        ],
      ),
    );
 }

  Widget showQrCodeView() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width - 6 - 0,
        decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(color: colorSecondary.withOpacity(0.04), blurRadius: 20, spreadRadius: 15),
        ]),
        padding: const EdgeInsets.all(60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/images/qrImage.png",
          ),
        ),
      ),
    );
  }
}
