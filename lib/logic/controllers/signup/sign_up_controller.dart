import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:morphzing/data/models/user/withsocials/get_token_provider.dart';
import 'package:morphzing/data/repositories/registration/check_socials.dart';
import 'package:morphzing/data/repositories/registration/sign_up_repository.dart';
import 'package:morphzing/presentation/routers/rout_names.dart';

import '../../../data/models/verification/phone_verification_get_provider.dart';
import '../../../data/repositories/registration/send_phone_number.dart';
import '../../../data/repositories/registration/sign_in_repositories.dart';

class SignUpController extends GetxController {
  RxString birthDate = ''.obs;
  Rx<DateTime> dateTime = DateTime.now().obs;
  Rx<DateTime> focusedDateTime = DateTime.now().obs;
  final box = GetStorage();
  RxBool signInLoading = false.obs;
  RxBool socialLoading = false.obs;
  File? currentImage;
  RxBool isLoading = false.obs;
  RxInt currentSex = 0.obs;
  RxString defaultSex = 'Prefer not to Say'.obs;
  RxBool withSocial = false.obs;


  afterSocialToVerification(String phone, bool isSocial, String name,
      String bio, String date, String secret, String sex) async {
    isLoading.value = true;
    var result = await SendPhoneNumberRepositories.verifyPhoneNumber(phone);
    PhoneVerificationGet response = PhoneVerificationGet.fromJson(
      jsonDecode(
        result.toString(),
      ),
    );
    if (response.success) {
      Get.toNamed(signUpVerification, arguments: [
        phone,
        isSocial,
        name,
        bio,
        date,
        secret,
        sex,
      ]);
    }
    isLoading.value = false;
    print('response ${response.success}');
    //
  }

  pickImageFromCamera() async {
    isLoading.value = true;
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);
    currentImage = imageTemporary;
    isLoading.value = false;
  }

  pickImageFromGallery() async {
    isLoading.value = true;
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    currentImage = imageTemporary;
    isLoading.value = false;
  }

  signIn(String phone, String password) async {
    print("phone $phone, password $password");
    signInLoading.value = true;
    try {
      var result = await SignInRepositories.signIn(phone, password);
      if (result.statusCode == 200) {
        var getTokenProvider = GetTokenProvider.fromJson(
          jsonDecode(
            result.toString(),
          ),
        );
        box.write('token', getTokenProvider.access);
        Get.offAllNamed(home);
      } else {}
    } catch (e) {
      print(e);
    }
  }

  fullSignUp(String secret, String fullName, String bio, String birthDate,
      String sex, String email, String password) async {
    isLoading.value = true;
    try {
      var result = await SignUpRepository.verifyPhoneNumber(
        secret,
        fullName,
        bio,
        birthDate,
        sex,
        email,
        password,
      );
      if (result.statusCode == 200) {
        var getTokenProvider = GetTokenProvider.fromJson(
          jsonDecode(
            result.toString(),
          ),
        );
        box.write('token', getTokenProvider.access);
        Get.offAllNamed(home);
      } else {}
    } catch (e) {
      print(e);
    }
    // if (response.success) {
    //   Get.toNamed(home, arguments: [phone]);
    // }
    // isLoading.value = false;
    //
  }

  Future<User?> signInWithGoogle(
      {required BuildContext context, required bool login}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      if (googleSignInAuthentication.accessToken != null) {
        if (login) {
          if (googleSignInAuthentication.accessToken != null) {
            try {
              var result = await CheckSocials.checkFacebook(
                  googleSignInAuthentication.accessToken.toString());
              if (result.statusCode == 200) {
                Get.toNamed(home);
              }
            } catch (e) {}
          }
        } else {
          Get.toNamed(afterSocial,
              arguments: [googleSignInAuthentication.accessToken.toString()]);
        }
      }

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }

    print(user);
    return user;
  }

  Future signUpAfterGoogle() async {}

  Future<UserCredential> signInWithFacebook(bool login) async {
    socialLoading.value = true;
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: [
        'email',
        'public_profile',
        'user_birthday',
      ],
    );
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    print('facebook ${loginResult.accessToken!.token}');
    if (loginResult.accessToken!.token.isNotEmpty) {
      if (login) {
        var result = await CheckSocials.checkFacebook(
            loginResult.accessToken!.token.toString());
        if (result.statusCode == 200) {
          Get.toNamed(home);
        }
      } else {
        Get.toNamed(afterSocial,
            arguments: [loginResult.accessToken!.token.toString()]);
      }
    }
    socialLoading.value = false;


    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
