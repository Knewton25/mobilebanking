// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:airpay/module/auth_module/view/passsword_recovery_screen.dart';

import 'package:airpay/uitily/String.dart';
import 'package:airpay/uitily/color_uitily.dart';
import 'package:airpay/uitily/common_app_bar.dart';
import 'package:airpay/uitily/common_button.dart';
import 'package:airpay/module/auth_module/view/otp_verification_screen.dart';
import 'package:airpay/module/auth_module/view/sign_up_screen.dart';

import '../../../uitily/common_text_field.dart';
import '../../../uitily/font_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      bottomNavigationBar: SizedBox(
        height: 150,
        child: bottomView(),
      ),
      appBar: commonAppBar(leading: SizedBox()),
      body: SingleChildScrollView( physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerView(),
              SizedBox(
                height: 40,
              ),
              textFieldView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonButton(
            title: AppString.signIn,
            onTap: () {
              Get.to(() => OtpVerificationScreen());
            }),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.dontHaveAccount,
              style: fontGray16W400,
            ),
            SizedBox(
              width: 4,
            ),
            InkWell(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                child: Text(
                  AppString.signUp,
                  style: fontRed16W500,
                )),
          ],
        )
        // SizedBox(
        //   height: 32,
        // ),
        // Image.asset("assets/images/orImage.png"),
        // SizedBox(
        //   height: 30,
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Expanded(
        //       child: FutureBuilder(
        //         future: Authentication.initializeFirebase(context: context),
        //         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //           return InkWell(
        //             onTap: (){
        //               Authentication.signInWithGoogle(context: context);
        //             },
        //             child: Container(
        //               height: 60,
        //               width: double.infinity,
        //               decoration: BoxDecoration(
        //                 border: Border.all(color: colorE5E7EB),
        //                 borderRadius: BorderRadius.circular(16),
        //               ),
        //               child: Image.asset(
        //                 "assets/images/googleImage.png",
        //                 scale: 3.5,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       width: 24,
        //     ),
        //     Expanded(
        //       child: Container(
        //         height: 60,
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //           color: Colors.transparent,
        //           border: Border.all(color: colorE5E7EB),
        //           borderRadius: BorderRadius.circular(16),
        //         ),
        //         child: Image.asset(
        //           "assets/images/appleImage.png",
        //           scale: 3.5,
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ],
    ).paddingAll(24);
  }

  Widget textFieldView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonTextField(
            keyboardType: TextInputType.emailAddress,
            hintText: AppString.email,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: color6B7280,
            )),
        SizedBox(
          height: 20,
        ),
        commonTextField(
            isPassword: true,
            hintText: AppString.password,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/lock.png",
                height: 10,
                width: 10,
                fit: BoxFit.fill,
                color: color6B7280,
              ),
            )),
        SizedBox(
          height: 24,
        ),
        InkWell(
          onTap: (){
            Get.to(() => PasswordRecoveryScreen());
          },
          child: Text(
            AppString.forgotPassword,
            style: fontRed16W700,
          ),
        )
      ],
    );
  }

  Widget headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.hiThere,
          style: fontBlack24W700,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          AppString.welcomeBackSignInYourAccount,
          style: fontGray16W400,
        ),
      ],
    );
  }
}

// class Authentication {
//   static Future<User?> signInWithGoogle({required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//     if (kIsWeb) {
//       GoogleAuthProvider authProvider = GoogleAuthProvider();
//
//       try {
//         final UserCredential userCredential = await auth.signInWithPopup(authProvider);
//
//         user = userCredential.user;
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       final GoogleSignIn googleSignIn = GoogleSignIn();
//
//       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//
//         try {
//           final UserCredential userCredential = await auth.signInWithCredential(credential);
//
//           user = userCredential.user;
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'account-exists-with-different-credential') {
//             // ...
//           } else if (e.code == 'invalid-credential') {
//             // ...
//           }
//         } catch (e) {
//           // ...
//         }
//       }
//     }
//
//     return user;
//   }
//
//   static Future<FirebaseApp> initializeFirebase({
//     required BuildContext context,
//   }) async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//
//     User? user = FirebaseAuth.instance.currentUser;
//
//     return firebaseApp;
//   }
// }
