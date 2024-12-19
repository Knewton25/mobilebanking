// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/Activity%20-%20Reports/view/line_chart_sample1.dart';
import 'package:airpay/module/main_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/font_style.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  RxInt isChart = 0.obs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: isChart.stream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: colorBg,
            appBar: commonAppBar(
                title: AppString.activity,
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
            body: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 10),
                Text(AppString.totalSpending, style: fontGray14W400),
                Text("\$8,189.00", style: fontBlack20W700),
                Row(
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        isChart.value = 0;
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(100), boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: colorSecondary.withOpacity(0.1),
                          )
                        ]),
                        child: Image.asset("assets/images/chart_1.png", height: 27, width: 27),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        isChart.value = 1;
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(100), boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: colorSecondary.withOpacity(0.1),
                          )
                        ]),
                        child: Image.asset("assets/images/chart_2.png", height: 27, width: 27),
                      ),
                    ),
                    Spacer(),
                    Container(
                      // height: 35,
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: colorWhite, borderRadius: BorderRadius.circular(100), border: Border.all(color: colorGray.withOpacity(0.05))),
                      child: Row(children: [
                        Text(AppString.thisMonth, style: fontRed12W500),
                        Icon(Icons.keyboard_arrow_down, color: colorPrimary, size: 20)
                      ]),
                    )
                  ],
                ),
                SizedBox(
                  height: 222,
                  width: MediaQuery.of(context).size.width,
                  child: isChart.value == 0 ? LineChartSample2() : LineChartSample1(),
                ),
                isChart.value == 0 ? bottomView1() : bottomView2()
              ],
            )),
          );
        });
  }

  bottomView1() {
    return Column(
      children: [
        Row(
          children: [
            Text(AppString.transaction, style: fontBlack16W600),
            Spacer(),
            Text(AppString.all, style: fontBlack16W600),
            Icon(
              Icons.keyboard_arrow_down,
              color: colorPrimary,
            )
          ],
        ),
        SizedBox(height: 10),
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
                    child: Image.asset("assets/images/gym.png")),
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
            ).paddingSymmetric(vertical: 5);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider().paddingSymmetric(horizontal: 16);
          },
        )
      ],
    ).paddingAll(16);
  }

  bottomView2() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12), color: colorBg, border: Border.all(color: colorGray.withOpacity(0.1))),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorGray.withOpacity(0.1)),
                        child: Icon(Icons.arrow_upward, color: colorPrimary, size: 20),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppString.income, style: fontGray14W400),
                          Text("\$4,600.00", style: fontBlack18W600),
                        ],
                      )
                    ]),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12), color: colorBg, border: Border.all(color: colorGray.withOpacity(0.1))),
                    child: Row(children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorGray.withOpacity(0.1)),
                        child: Icon(Icons.arrow_downward, color: colorSecondary, size: 20),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppString.expense, style: fontGray14W400),
                          Text("\$1,498.66", style: fontBlack18W600),
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(AppString.categories, style: fontBlack16W600),
                Spacer(),
                Text(AppString.expense, style: fontBlack16W600),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: colorPrimary,
                )
              ],
            ),
          ],
        ).paddingAll(16),
        SizedBox(
            height: 125,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: allTransactions.length,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 120,
                  width: 115,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: colorGray.withOpacity(0.1)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Image.asset(allTransactions[index].imagePath ?? "", height: 30, width: 30).paddingAll(8),
                    Spacer(),
                    Text(allTransactions[index].title ?? "", style: fontGray14W400, maxLines: 1),
                    Text(allTransactions[index].payment ?? "",
                        style: fontBlack16W600.copyWith(color: (allTransactions[index].payment?[0]) == "-" ? colorFF3A46 : colorSecondary))
                  ]),
                );
              },
            )),
        SizedBox(height: 16),
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
