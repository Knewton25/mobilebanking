import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/country_piker/src/currency.dart';

class CounterController extends GetxController{
  static CounterController get to => Get.find();
  Currency? countryData;
  TextEditingController  countryNameController = TextEditingController();
}