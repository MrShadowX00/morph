import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphzing/core/constants/const_lists.dart';
import 'package:morphzing/logic/controllers/signup/sign_up_controller.dart';

import '../../../../../utils/style/colors.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/input_field.dart';

class SignUpAfterSocial extends StatefulWidget {
  final String password;

  const SignUpAfterSocial({Key? key, required this.password}) : super(key: key);

  @override
  State<SignUpAfterSocial> createState() => _SignUpAfterSocialState();
}

class _SignUpAfterSocialState extends State<SignUpAfterSocial> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  SignUpController signUpController = Get.put(
    SignUpController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticAppBar.customAppBar(context, 'Sign up'),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode(),);
        },
        child: Obx(() {
          return Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: whiteColor,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                          ),
                          child: SizedBox(
                            height: 100,
                            width: Get.width,
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: blueColor,
                                      image: (signUpController.currentImage !=
                                              null)
                                          ? DecorationImage(
                                              image: FileImage(
                                                  signUpController.currentImage!),
                                              fit: BoxFit.cover,
                                            )
                                          : const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/user_avatar.png'),
                                            ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(Container(
                                            height: 150,
                                            color: whiteColor,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        signUpController
                                                            .pickImageFromCamera();
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                          color: greyButton,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.camera,
                                                            size: 30,
                                                            color: blackTextColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.0),
                                                      child: Text(
                                                        'Camera',
                                                        style: TextStyle(
                                                          color: blackTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        signUpController
                                                            .pickImageFromGallery();
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                          color: greyButton,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons.image,
                                                            size: 30,
                                                            color: blackTextColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.0),
                                                      child: Text(
                                                        'Gallery',
                                                        style: TextStyle(
                                                          color: blackTextColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )));
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: greyButton,
                                        ),
                                        child: Center(
                                          child: (signUpController.currentImage !=
                                                  null)
                                              ? const Icon(
                                                  CupertinoIcons
                                                      .arrow_2_circlepath,
                                                  color: blackTextColor,
                                                  size: 20,
                                                )
                                              : const Icon(
                                                  Icons.add_a_photo_outlined,
                                                  color: blackTextColor,
                                                  size: 20,
                                                ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 10),
                          child: Text(
                            'What is your full name?',
                            style: TextStyle(
                              color: blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CustomInputField(
                              hintText: 'Enter your name',
                              textEditingController: nameController,
                              labelText: 'Enter your name'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 10),
                          child: Text(
                            'About me',
                            style: TextStyle(
                              color: blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CustomInputField(
                              hintText: 'Bio',
                              textEditingController: bioController,
                              labelText: 'Bio'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 10),
                          child: Text(
                            'Please enter your birthday date',
                            style: TextStyle(
                              color: blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CustomInputField(
                              hintText: 'Birthday date',
                              textEditingController: dateController,
                              labelText: 'Birthday date'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 10),
                          child: Text(
                            'Please enter your phone',
                            style: TextStyle(
                              color: blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CustomInputField(
                            hintText: 'Phone',
                            textEditingController: emailController,
                            labelText: 'Phone',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14, bottom: 10),
                          child: Text(
                            'How do you identify',
                            style: TextStyle(
                              color: blackTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.bottomSheet(Obx(() {
                                return Container(
                                  padding: const EdgeInsets.all(20),
                                  height: 360,
                                  decoration: const BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'How do you identify',
                                                style: TextStyle(
                                                  color: blackTextColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'SF Pro Display',
                                                  fontSize: 20,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    color: greyButton,
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      CupertinoIcons.clear,
                                                      size: 20,
                                                      color: blackTextColor,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            signUpController.currentSex.value = 1;
                                            signUpController.defaultSex.value =
                                                SEX_LISTS[0];
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            height: 48,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: greyButton,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  SEX_LISTS[0],
                                                  style: const TextStyle(
                                                    color: blackTextColor,
                                                    fontFamily: 'SF Pro Display',
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                (signUpController
                                                            .currentSex.value ==
                                                        1)
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        size: 26,
                                                        color: blueColor)
                                                    : Container(
                                                        height: 26,
                                                        width: 26,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            signUpController.currentSex.value = 2;
                                            signUpController.defaultSex.value =
                                                SEX_LISTS[1];
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            height: 48,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: greyButton,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  SEX_LISTS[1],
                                                  style: const TextStyle(
                                                    color: blackTextColor,
                                                    fontFamily: 'SF Pro Display',
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                (signUpController
                                                            .currentSex.value ==
                                                        2)
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        size: 26,
                                                        color: blueColor)
                                                    : Container(
                                                        height: 26,
                                                        width: 26,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            signUpController.currentSex.value = 3;
                                            signUpController.defaultSex.value =
                                                SEX_LISTS[2];
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            height: 48,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              color: greyButton,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  SEX_LISTS[2],
                                                  style: const TextStyle(
                                                    color: blackTextColor,
                                                    fontFamily: 'SF Pro Display',
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                (signUpController
                                                            .currentSex.value ==
                                                        3)
                                                    ? const Icon(
                                                        Icons.check_circle,
                                                        size: 26,
                                                        color: blueColor)
                                                    : Container(
                                                        height: 26,
                                                        width: 26,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 20,
                                          top: 20,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 50,
                                            width:
                                                MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: (signUpController
                                                      .isLoading.value)
                                                  ? const CircularProgressIndicator(
                                                      color: whiteColor,
                                                    )
                                                  : const Text(
                                                      'Save',
                                                      style: TextStyle(
                                                        color: whiteColor,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            "SF Pro Display",
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }));
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    )),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      signUpController.defaultSex.value,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'SF Pro Display',
                                        color: hintTextColor,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: blackTextColor,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: GestureDetector(
                      onTap: () {
                        // print( nameController.text,);
                        // print( SignUpVerificationScreen.secretKey,);
                        // print( bioController.text,);
                        // print( dateController.text,);
                        // print(emailController.text,);
                        // print(widget.password,);
                        // print(  SEX_LISTS[signUpController.currentSex.value-1].substring(0,1).toUpperCase(),);
                        if (emailController.text.isNotEmpty &&
                            emailController.text.length == 11) {
                          signUpController.afterSocialToVerification(
                            emailController.text,
                            true,
                            nameController.text,
                            bioController.text,
                            dateController.text,
                            widget.password,
                            SEX_LISTS[signUpController.currentSex.value - 1]
                                .substring(0, 1)
                                .toUpperCase(),
                          );
                        }
                        // signUpController.fullSignUp(
                        //   SignUpVerificationScreen.secretKey,
                        //   nameController.text,
                        //   bioController.text,
                        //   dateController.text,
                        //   SEX_LISTS[signUpController.currentSex.value-1].substring(0,1).toUpperCase(),
                        //   emailController.text,
                        //   widget.password,
                        // );
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: (signUpController.isLoading.value)
                              ? const CircularProgressIndicator(
                                  color: whiteColor,
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
                  )
                ],
              ));
        }),
      ),
    );
  }
}
