// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:airpay/module/auth_module/view/splash_screen.dart';
import 'package:airpay/service/app_binding.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Local Storage
GetStorage getPreference = GetStorage();

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(
            context,
            GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: widget!)),
        maxWidth: 1200,
        minWidth: 375,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(375, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      theme: ThemeData(fontFamily: "poppins", backgroundColor: Colors.white),
      // home: const MainScreen(),
      home: const SplashScreen(),
    );
  }
}
