import 'package:flutter/material.dart';
import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: AppString.editAccount),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: commonButton(title: AppString.save),
      ),
      body: SingleChildScrollView( physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          commonTextField(title: AppString.yourName, hintText: "Anant", isTitle: true),
          const SizedBox(height: 10),
          commonTextField(title: AppString.employer, hintText: AppString.overlayDesign, isTitle: true),
          const SizedBox(height: 10),
          commonTextField(title: AppString.phoneNumber, hintText: AppString.number, isTitle: true),
          const SizedBox(height: 10),
          commonTextField(title: AppString.email, hintText: AppString.anabelangellaGmailCom, isTitle: true),
          const SizedBox(height: 10),
        ]),
      ),
    );
  }
}
