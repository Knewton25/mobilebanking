import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BioMetricController extends GetxController{
  static BioMetricController get to => Get.find();
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  bool isAuthenticating = false;
  String authorized = 'Not Authorized';


  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
        isAuthenticating = true;
        authorized = 'Authenticating';
      authenticated = await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
        isAuthenticating = false;
        authorized = 'Authenticating';

    } on PlatformException catch (e) {
      print(e);
        isAuthenticating = false;
        authorized = 'Error - ${e.message}';

      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';

      authorized = message;

  }


}
enum SupportState {
  unknown,
  supported,
  unsupported,
}