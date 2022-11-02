import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphzing/logic/controllers/verification/sms_verification.dart';

import '../../../../../core/constants/style.dart';
import '../../../../../utils/style/colors.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/input_field.dart';

class SignUpVerificationScreen extends StatefulWidget {
  final bool isSocial;
  final String email;
  final String? secret;
  final String? fullName;
  final String? bio;
  final String? birthDate;
  final String? sex;
  static String secretKey = '';

  const SignUpVerificationScreen({Key? key,
    required this.email,
    this.secret,
    this.fullName,
    this.bio,
    this.birthDate,
    this.sex,
    required this.isSocial})
      : super(key: key);

  @override
  State<SignUpVerificationScreen> createState() =>
      _SignUpVerificationScreenState();
}

class _SignUpVerificationScreenState extends State<SignUpVerificationScreen> {
  TextEditingController verificationController = TextEditingController();
  SmsVerificationController smsVerificationController = Get.put(
    SmsVerificationController(),
  );

  @override
  void initState() {
    super.initState();
    // smsVerificationController.customTimer();
  }

  @override
  void dispose() {
    smsVerificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: StaticAppBar.customAppBar(context, 'Sign up'),
      body: GestureDetector(onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      }, child: Obx(() {
        return Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: whiteColor,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 4),
                        child: Text(
                          'Verification',
                          style: TextStyle(
                            color: blackTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF Pro Display',
                            fontSize: 34,
                          ),
                        ),
                      ),
                      const Text(
                        'Please enter the code that we\'ve sent to',
                        style: TextStyle(
                          color: hintTextColor,
                          fontFamily: 'SF Pro Display',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                          color: blackTextColor,
                          fontFamily: 'SF Pro Display',
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: (smsVerificationController.timeIsEnded.value)?GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child:  Text(
                            'Change phone number',
                            style:  staticTextStyle(15, blueColor)
                          ),
                        ):Container(),
                      ),
                      CustomInputField(
                          hintText: 'Code verification',
                          textEditingController: verificationController,
                          labelText: 'Code verification')
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 66,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: bgColor,
                            ),
                            child: Center(
                              child: (smsVerificationController
                                  .timeIsEnded.value)
                                  ? GestureDetector(
                                onTap: () {
                                  smsVerificationController
                                      .postPhoneNumberToVerification(
                                      widget.email);
                                },
                                child: const Icon(
                                  Icons.refresh,
                                  color: blackTextColor,
                                  size: 20,
                                ),
                              )
                                  : Text(
                                smsVerificationController.endTime.value
                                    .toString(),
                                style: const TextStyle(
                                  color: blackTextColor,
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (!smsVerificationController.verificationLoader
                                  .value) {
                                if (verificationController.text.isNotEmpty &&
                                    verificationController.text.length >= 5) {
                                  smsVerificationController
                                      .sendSMSCodeToVerification(
                                      widget.email,
                                      verificationController.text,
                                      widget.isSocial, [
                                    widget.secret!,
                                    widget.fullName!,
                                    widget.bio!,
                                    widget.birthDate!,
                                    widget.sex!,
                                    widget.email,
                                  ]);
                                } else {
                                  Get.snackbar(
                                      '', 'Invalid verification code!');
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child:
                                (smsVerificationController.verificationLoader
                                    .value)
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : const Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 16,
                                    fontFamily: "SF Pro Display",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ));
      })),
    );
  }
}
