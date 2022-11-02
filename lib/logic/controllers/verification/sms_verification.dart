import 'dart:convert';

import 'package:get/get.dart';
import 'package:morphzing/data/models/user/user_verify_provider.dart';
import 'package:morphzing/data/models/verification/phone_verification_get_provider.dart';
import 'package:morphzing/data/repositories/registration/send_phone_number.dart';
import 'package:morphzing/data/repositories/registration/sign_up_repository.dart';
import 'package:morphzing/presentation/pages/screens/registration/singup/sign_up_verification_screen.dart';

import '../../../data/models/user/withsocials/get_token_provider.dart';
import '../../../presentation/routers/rout_names.dart';

class SmsVerificationController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool verificationLoader = false.obs;
  RxInt endTime = 60.obs;
  RxBool timeIsEnded = false.obs;

  customTimer()async{
    timeIsEnded.value = false;
    for(int i = 60; i>=0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      print(i);
      endTime.value = i;
    }
    timeIsEnded.value = true;
  }



  @override
  void onInit() {
    super.onInit();
  }

  postPhoneNumberToVerification(String phone) async {
    isLoading.value = true;
    // try {
      var result = await SendPhoneNumberRepositories.verifyPhoneNumber(phone);
      PhoneVerificationGet response = PhoneVerificationGet.fromJson(
        jsonDecode(
          result.toString(),
        ),
      );
      if (response.success) {
        Get.toNamed(signUpVerification,
            arguments: [phone, false, '', '', '', '', '']);
        customTimer();
      }
    // }catch(e){
    //
    // }
    isLoading.value = false;

    //
  }

  sendSMSCodeToVerification(String phone, String smsCode, bool isSocial, List<String> info) async {
    verificationLoader.value = true;
    try {
      var result =
      await SendPhoneNumberRepositories.verifySmsCode(phone, smsCode);
      UserVerifiedSuccess response = UserVerifiedSuccess.fromJson(
        jsonDecode(
          result.toString(),
        ),
      );
      if (response.success) {
        if (isSocial) {
          await afterSocialSignUp(
            info[0], info[1], info[2], info[3], info[4], info[5],);
        } else {
          SignUpVerificationScreen.secretKey = response.secret;
          print(response);
          Get.toNamed(createPassword);
        }
      }
    }catch(e){}
    verificationLoader.value = false;
  }

  afterSocialSignUp(String secret, String name, String bio, String date,
      String sex, String phone) async{
    print(' all here : $secret,  $name, $bio, $date, $sex, $phone');
    isLoading.value = true;
    try {
      var result = await SignUpRepository.afterSocialSignUp(
        secret,
        name,
        bio,
        date,
        sex,
        phone,
      );
      print('result ------->${result.toString()}');
      if (result.statusCode == 200) {
        var getTokenProvider = GetTokenProvider.fromJson(
          jsonDecode(
            result.toString(),
          ),
        );
        // box.write('token', getTokenProvider.access);

      } else {}

    } catch (e) {
      print(e);
    }
    Get.offAllNamed(home);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
