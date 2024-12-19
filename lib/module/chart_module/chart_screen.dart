import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Support Help"),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10+(MediaQuery.of(context).viewInsets.bottom),),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/pinImage.png",
                  height: 30,
                  width: 30,
                  fit: BoxFit.fill,
                ).paddingAll(10),
                Expanded(child: commonTextField(hintText: "Type here...", isTitle: false)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            chartView(),
          ],
        ),
      ),
    );
  }

  Widget chartView() {
    return ListView.builder(
        itemCount: chartList.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Align(
            alignment: (index % 2) == 0 ? Alignment.topLeft : Alignment.topRight,
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: (index % 2) == 0 ? colorBg : colorPrimary,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10))),
              child: Text(chartList[index],
                  style: fontBlack16W600.copyWith(color: (index % 2) == 0 ? colorSecondary : colorWhite, fontSize: 15, fontWeight: FontWeight.w400)),
            ),
          );
        });
  }
}

List<String> chartList = ["Anabella Angela", "Hello! my name is Smarty before we start, what is your name?", "How to create a Smartpay account?"];
