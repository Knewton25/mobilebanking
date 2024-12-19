import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/font_style.dart';

import 'contacts_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          title: AppString.notification, actions: [InkWell(onTap: () {}, child: Image.asset("assets/images/profile_icons/done.png").paddingAll(10))]),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today", style: fontGray16W600),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return commonProfileView(
                      title: notifactionList[index].title ?? "",
                      image: 'assets/images/profile_icons/Alert.png',
                      time: notifactionList[index].payment ?? "",
                      title1: notifactionList[index].description);
                },
              ),
              const SizedBox(height: 10),
              Text("25, Dec", style: fontGray16W600),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: notifactionList1.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return commonProfileView(
                      title: notifactionList1[index].title,
                      image: 'assets/images/profile_icons/Alert.png',
                      time: notifactionList1[index].payment ?? "",
                      title1: notifactionList1[index].description);
                },
              ),
            ],
          )),
    );
  }

  commonProfileView({required String image, String? title, String? title1, String? time, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorF9FAFB),
                  child: Image.asset(image, height: 25)),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? "", style: fontBlack16W600),
                  Text(title1 ?? "", style: fontGray14W400),
                ],
              )),
              Text(time ?? "", style: fontGray14W400),
            ],
          ),
        ),
      ),
    );
  }
}

List<AllTransactions> notifactionList = [
  AllTransactions(title: "Rewards", description: "Loyal user rewards!", payment: "1m ago", imagePath: "assets/images/profile_icons/user_name.png"),
  AllTransactions(
      title: "Money Transfer",
      description: "You have successfully sent money to Maria of...",
      payment: "10m ago",
      imagePath: "assets/images/profile_icons/user_name_1.png"),
];
List<AllTransactions> notifactionList1 = [
  AllTransactions(
      title: "Payment Notification", description: "Successfully paid!", payment: "Sep 21", imagePath: "assets/images/profile_icons/user_name_2.png"),
  AllTransactions(
      title: "Top Up", description: "Your top up is successfully!", payment: "Sep 22", imagePath: "assets/images/profile_icons/user_name.png"),
  AllTransactions(
      title: "Money Transfer",
      description: "You have successfully sent money to Maria of...",
      payment: "Sep 22",
      imagePath: "assets/images/profile_icons/user_name_1.png"),
  AllTransactions(
      title: "Cashback 25%",
      description: "You have successfully sent money to Maria of...",
      payment: "Sep 21",
      imagePath: "assets/images/profile_icons/user_name_1.png"),
  AllTransactions(
      title: "Payment Notification", description: "Successfully paid!", payment: "Sep 20", imagePath: "assets/images/profile_icons/user_name_1.png"),
];
