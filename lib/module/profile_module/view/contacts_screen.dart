// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/profile_module/view/account_info_screen.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_text_field.dart';
import 'package:airpay/uitily/font_style.dart';

import '../../home_module/view/home_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: AppString.contacts),
      body: SingleChildScrollView( physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonTextField(hintText: AppString.search),
              const SizedBox(height: 10),
              Text(AppString.recentContacts, style: fontGray16W400),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(contactList[index].imagePath ?? "", height: 70, width: 70)),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contactList[index].title ?? "", style: fontBlack18W600),
                          const SizedBox(height: 7),
                          Text(contactList[index].description ?? "", style: fontGray16W400)
                        ],
                      )
                    ],
                  ).paddingOnly(bottom: 10);
                },
              ),
              Divider(),
              const SizedBox(height: 10),
              Text(AppString.allContacts, style: fontGray16W400),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: allContactList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(allContactList[index].imagePath ?? "", height: 70, width: 70)),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(allContactList[index].title ?? "", style: fontBlack18W600),
                          const SizedBox(height: 7),
                          Text(allContactList[index].description ?? "", style: fontGray16W400)
                        ],
                      )
                    ],
                  ).paddingOnly(bottom: 10);
                },
              ),
            ],
          )),
    );
  }
}
class AllTransactions {
  String? title;
  String? description;
  String? payment;
  String? imagePath;

  AllTransactions({this.title, this.description, this.payment, this.imagePath});
}
List<AllTransactions> contactList = [
  AllTransactions(title: "Sahil kathiriya", description: "**** **** **** 4582", payment: "- \$55.0", imagePath: "assets/images/profile_icons/user_name.png"),
  AllTransactions(title: "Moni Roy", description: "**** **** **** 2584", payment: "+ \$2541.0", imagePath: "assets/images/profile_icons/user_name_1.png"),
  AllTransactions(title: "Jams bond", description: "**** **** **** 4451", payment: "- \$540.0", imagePath: "assets/images/profile_icons/user_name_2.png"),

];

List<AllTransactions> allContactList = [
  AllTransactions(title: "Sem Roy", description: "**** **** **** 2147", payment: "- \$540.0", imagePath: "assets/images/profile_icons/user_name.png"),
  AllTransactions(title: "Ashavin Rathod", description: "**** **** **** 2314", payment: "- \$540.0", imagePath: "assets/images/profile_icons/user_name_1.png"),
  AllTransactions(title: "Manu Vaghani", description: "**** **** **** 1254", payment: "- \$540.0", imagePath: "assets/images/profile_icons/user_name_2.png"),
  AllTransactions(title: "Saumin Hirpara", description: "**** **** **** 0142", payment: "- \$540.0", imagePath: "assets/images/profile_icons/user_name.png"),
  AllTransactions(title: "Sem Vilasam", description: "**** **** **** 6654", payment: "- \$540.0", imagePath: "assets/images/profile_icons/user_name_1.png"),
];