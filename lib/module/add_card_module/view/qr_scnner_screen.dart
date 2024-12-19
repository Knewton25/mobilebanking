// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airpay/module/add_card_module/view/show_qr_code_screen.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/font_style.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // QRViewController? controller;
  MobileScannerController controller = MobileScannerController();
  bool isCheckValidQR = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // controller!.pauseCamera();
    } else if (Platform.isIOS) {
      // controller!.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: MobileScanner(
                      allowDuplicates: true,
                      controller: controller,
                      onDetect: (barcode, args) {
                        if (barcode.rawValue != null) {
                          controller.dispose();
                          if (kDebugMode) {
                            print("======>>>>>>>>>{{{{{{>?>>>>????.------------${barcode.rawValue.toString()}");
                          }
                        }
                        setState(() {});
                      }),
                ),
              ],
            ),
            Positioned(
              top: 20,
              child: Text("Qr Code", style: fontBlack16W600.copyWith(color: colorWhite, fontSize: 18)),
            ),
            Image.asset(
              "assets/images/qrCodeImage.png",
              height: 250,
            ).paddingOnly(bottom: 50),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.25,
                child: Text(
                  'Align QR Code within frame to scan',
                  style: fontBlack16W600.copyWith(color: colorWhite),
                )),
            Positioned(
              top: 15,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorWhite.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorGray.withOpacity(0.6)),
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_back_ios_new_outlined, color: colorWhite, size: 20),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ShowQrCodeScreen());
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorWhite.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colorGray.withOpacity(0.6)),
                    ),
                    child: Center(
                        child: Image.asset(
                      "assets/images/dotsImage.png",
                      height: 30,
                      color: colorWhite,
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

/*
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isCheckValidQR) {
        isCheckValidQR = true;
        if (kDebugMode) {
          print("SCAN RESULT => ${splitQueryString(scanData.code.toString().split("?").last)}");
        }
        if (scanData.code.toString().contains("?data=")) {
          handleLinkData(scanData.code.toString());
          previewType = PreviewType.clientTheme;
          Get.offAll(() => const SplashScreen());
          return;
        }
        isCheckValidQR = false;
      }
    });
  }
*/
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
