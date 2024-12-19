import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:airpay/uitily/font_style.dart';

class MyBankScreen extends StatefulWidget {
  const MyBankScreen({Key? key}) : super(key: key);

  @override
  State<MyBankScreen> createState() => _MyBankScreenState();
}

List<Model> list = List.generate(30, (index) {
  return Model()..index = index;
});

class _MyBankScreenState extends State<MyBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: AppString.myBank),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppString.yourBankAccount, style: fontBlack22W600).paddingSymmetric(horizontal: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SwipeActionCell(
                key: ObjectKey(list[index]),
                trailingActions: [
                  SwipeAction(
                      title: "Delete",
                      backgroundRadius: 10,
                      onTap: (CompletionHandler handler) async {
                        await handler(true);
                        list.removeAt(index);
                        setState(() {});
                      },
                      color: Colors.red)
                ],
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration:
                      BoxDecoration(color: colorBg, border: Border.all(color: colorGray.withOpacity(0.1)), borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: colorGray.withOpacity(0.1)),
                              child: Image.asset("assets/images/Bank of America Icon.png", height: 35, width: 35)),
                          Positioned(bottom: -2, right: -2, child: Icon(Icons.verified, color: colorPrimary))
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppString.cardDetail, style: fontBlack18W600),
                          Text(AppString.cardDetail, style: fontGray16W400),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}

class Model {
  String id = UniqueKey().toString();
  int index = 0;

  @override
  String toString() {
    return index.toString();
  }
}
