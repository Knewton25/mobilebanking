import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/module/auth_module/view/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    /// logo Image
    return Container(
      color: colorWhite,
      padding: const EdgeInsets.all(130),
      child: Center(child: Image.asset("assets/images/logo.png")),
    );
  }

  /// Splash Screen Timer
  timer() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => OnBoardingScreen());
    });
  }
}
