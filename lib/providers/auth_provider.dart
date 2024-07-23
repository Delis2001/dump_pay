// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, unused_import

import 'package:dump_pay/models/api_result.dart';
import 'package:dump_pay/screens/auths/add_bio_screen.dart';
import 'package:dump_pay/screens/auths/add_email_screen.dart';
import 'package:dump_pay/screens/auths/otp_pincode_screen.dart';
import 'package:dump_pay/screens/home/home_screen.dart';
import 'package:dump_pay/services/auth_service.dart';
import 'package:dump_pay/utils/endpoint.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String email = '';

  emails(String value) {
    email = value;
  }

  getEmailToken(BuildContext context, String email) async {
    ApiResult result = await AuthService.getEmailToken(email);
    emails(email);
    if (result.success == true) {
      print(result.response!.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => OtpPinCodeSreen()));
    } else {
      print(result.message);
    }
  }

  verifyEmailToken(BuildContext context, String token) async {
    ApiResult result =
        await AuthService.verifyEmailToken(email: email, token: token);
    if (result.success == true) {
      print(result.response!.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AddBioScreen()));
    } else {
      print(result.message);
    }
  }

  register(BuildContext context,
      {required fullName,
      String userName = '',
      required String countryCode,
      required String password}) async {
    ApiResult result = await AuthService.register(
        email: email,
        full_name: fullName,
        username: userName,
        countryCode: countryCode,
        password: password,
        device_name: 'Mobile');
    if (result.success == true) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      print(result.response!.body);
    } else {
      print(result.message);
      (result.response == null)
          ? print('An error occured')
          : (result.response!.body);
    }
  }

  signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    ApiResult result = await AuthService.getLogin(email, password, 'mobile');
    if (result.success == true) {
      print(result.response!.body);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => AddEmailScreen()));
    } else {
      print(result.message);
    }
  }
}
