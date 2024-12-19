import 'package:get/get.dart';
import 'package:airpay/module/auth_module/controller/biometric_controller.dart';
import 'package:airpay/module/auth_module/controller/country_controller.dart';
import 'package:airpay/module/auth_module/controller/on_boarding_controller.dart';

class AppBinding extends Bindings{
  @override
  Future<void> dependencies() async {
    Get.put<OnBoardingController>(OnBoardingController(), permanent: true);
    Get.put<BioMetricController>(BioMetricController(), permanent: true);
    Get.put<CounterController>(CounterController(), permanent: true);
  }
}