import 'dart:io';

import 'package:dio/dio.dart';
import 'package:morphzing/core/constants/urls.dart';
import 'package:morphzing/data/models/user/user_verify_provider.dart';
import 'package:morphzing/data/models/verification/phone_verification_provider.dart';

class SendPhoneNumberRepositories {
  static verifyPhoneNumber(String phone) async {
    Dio dio = Dio();
    final result = await dio.post(
      BASE_URL + USER_AUTH,
      data: PhoneVerificationPost(phone: phone).toJson(),
      options: Options(
        headers:{},
        contentType: Headers.jsonContentType,
      )
    );
    print(result);
    return result;
  }

  static verifySmsCode(String phone, String smsCode)async {
    Dio dio = Dio();
    final result = await dio.post(
      BASE_URL+USER_VERIFY,
      data:UserVerification(phone: phone, code: smsCode),
      options: Options(
        headers: {},
        contentType: Headers.jsonContentType,
      )
    );
    print(result);
    return result;
  }
}
