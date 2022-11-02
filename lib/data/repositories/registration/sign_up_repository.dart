import 'package:dio/dio.dart';
import 'package:morphzing/data/models/user/sign_up_provider.dart';
import 'package:morphzing/data/models/user/withsocials/signup_afeter_socials_provider.dart';

import '../../../core/constants/urls.dart';

class SignUpRepository {
  static verifyPhoneNumber(
    String secret,
    String fullName,
    String bio,
    String birthDate,
    String sex,
    String email,
    String password,
  ) async {
    Dio dio = Dio();
    var result = await dio.post(BASE_URL + USER_SIGNUP,
        data: FullSignUpProvider(
          secret: secret,
          fullName: fullName,
          bio: bio,
          birthDate: birthDate,
          sex: sex,
          email: email,
          password: password,
        ),
        options: Options(
          headers: {},
          contentType: Headers.jsonContentType,
        ));
    print(result);

    return result;
  }

  static afterSocialSignUp(String secret, String fullName, String bio,
      String birthDate, String sex, String phone) async {
    Dio dio = Dio();
    var result = await dio.post(BASE_URL + USER_SIGNUP_SOCIALS,
        data: SignUpAfterSocialsProvider(
          secret: secret,
          fullName: fullName,
          bio: bio,
          birthDate: birthDate,
          sex: sex,
          phone: phone,
        ),
        options: Options(
          headers: {},
          contentType: Headers.jsonContentType,
        ));
    print(result);

    return result;
  }
}
