// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/uitily/common_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBg,
      appBar: commonAppBar(title: "Change Password"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: commonButton(title: "Done"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            commonTextField(title: "Old Password",isTitle: true,hintText: "Enter Old Password"),
            SizedBox(height: 16),
            commonTextField(title: "new Password",isTitle: true,hintText: "Enter new Password"),
            SizedBox(height: 16),
            commonTextField(title: "Confirm Password",isTitle: true,hintText: "Enter Confirm Password"),
          ],
        ),
      ),
    );
  }
}
