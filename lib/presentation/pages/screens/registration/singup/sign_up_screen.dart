import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:morphzing/logic/controllers/signup/sign_up_controller.dart';
import 'package:morphzing/logic/controllers/verification/sms_verification.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../utils/style/colors.dart';
import '../../../../routers/rout_names.dart';
import '../../../../widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailTextController = TextEditingController();
  final smsVerificationController = Get.put(SmsVerificationController());
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        title: const Text(
          'Sign up',
          style: TextStyle(
            color: blackTextColor,
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode(),);
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: whiteColor,
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GradientText(
                        'M',
                        style: const TextStyle(
                          color: blackTextColor,
                          fontSize: 34,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.bold,
                        ),
                        colors: const [
                          Colors.red,
                          Colors.pink,
                          Colors.purple,
                          Colors.deepPurple,
                          Colors.deepPurple,
                          Colors.indigo,
                          Colors.blue,
                          Colors.lightBlue,
                          Colors.cyan,
                          Colors.teal,
                          Colors.green,
                          Colors.lightGreen,
                          Colors.lime,
                          Colors.yellow,
                          Colors.amber,
                          Colors.orange,
                          Colors.deepOrange,
                        ],
                      ),
                      const Text('orph your future',
                          style: TextStyle(
                            color: blackTextColor,
                            fontSize: 34,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('into something',
                          style: TextStyle(
                            color: blackTextColor,
                            fontSize: 34,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.bold,
                          ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                    left: 30,
                    right: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('ama',
                          style: TextStyle(
                            color: blackTextColor,
                            fontSize: 34,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.bold,
                          )),
                      GradientText(
                        'Z',
                        style: const TextStyle(
                          color: blackTextColor,
                          fontSize: 34,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.bold,
                        ),
                        colors: const [
                          Colors.red,
                          Colors.pink,
                          Colors.purple,
                          Colors.deepPurple,
                          Colors.deepPurple,
                          Colors.indigo,
                          Colors.blue,
                          Colors.lightBlue,
                          Colors.cyan,
                          Colors.teal,
                          Colors.green,
                          Colors.lightGreen,
                          Colors.lime,
                          Colors.yellow,
                          Colors.amber,
                          Colors.orange,
                          Colors.deepOrange,
                        ],
                      ),
                      const Text('ing',
                          style: TextStyle(
                            color: blackTextColor,
                            fontSize: 34,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 50,
                  top: 25,
                ),
                child: CustomInputField(
                  hintText: 'Enter phone number',
                  textEditingController: emailTextController,
                  labelText: 'Enter phone number',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 100,
                  bottom: 10,
                ),
                child: Obx(
                  () {
                    return GestureDetector(
                      onTap: () {
                        if(!smsVerificationController.isLoading.value) {
                          if (emailTextController.text.length == 11) {
                            smsVerificationController
                                .postPhoneNumberToVerification(
                                emailTextController.text);
                          } else {
                            Get.snackbar('',
                                'Phone number length must be 11 characters');
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Center(
                          child: (smsVerificationController.isLoading.value)?const CircularProgressIndicator(color: Colors.white,):const Text(
                            'Continue',
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                              fontFamily: "SF Pro Display",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SizedBox(
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: bgColor,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 16),
                          child: const Text(
                            'Or Sign up with',
                            style: TextStyle(
                              color: blackTextColor,
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
             Obx((){
               return  Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   GestureDetector(
                     onTap: ()async{
                       User? user = await signUpController.signInWithGoogle(context: context, login: false,);
                       print(user!.email.toString());
                     },
                     child: (signUpController.withSocial.value)?const CircularProgressIndicator():socialLinks(whiteColor, 'assets/icons/google.svg',),
                   ),
                   GestureDetector(
                     onTap: ()async{
                       var data = await signUpController.signInWithFacebook(false);
                       print(data.user);
                     },
                     child: socialLinks(const Color(0xFF3B5A9A),
                       'assets/icons/facebook.svg', ),
                   ),
                   socialLinks(Colors.black, 'assets/icons/apple.svg',),
                 ],
               );
             }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: greyTextColor,
                        fontFamily: 'SF Pro Display',
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, login, (route) => false);
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: blueColor,
                          fontFamily: 'SF Pro Display',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  socialLinks(Color clr, String asset) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child:  Container(
          height: 40,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: clr,
              border: (clr == whiteColor)
                  ? Border.all(width: 1, color: borderColor)
                  : Border.all(color: clr)),
          child: Center(
            child: SizedBox(
              height: 14,
              width: 14,
              child: SvgPicture.asset(asset),
            ),
          ),
      ),
    );
  }
}
