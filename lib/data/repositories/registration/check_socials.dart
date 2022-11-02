import 'package:dio/dio.dart';
import 'package:morphzing/core/constants/urls.dart';
import 'package:morphzing/data/models/user/withsocials/social_facebook_provider.dart';

class CheckSocials{

  static checkFacebook(String token)async{
    Dio dio = Dio();
    var result = await dio.post(
      BASE_URL+USER_LOGIN_FB,
      options: Options(),
      data: SocialFacebookProvider(authToken: token).toJson(),
    );
    return result;
  }
  static checkGoogle(String token)async{
    Dio dio = Dio();
    try {
      var result = await dio.post(
        BASE_URL + USER_LOGIN_GOOGLE,
        options: Options(),
        data: SocialFacebookProvider(authToken: token).toJson(),
      );
      return result;
    }catch (e){}
    return;
  }
}