import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/style/colors.dart';
import '../../../../routers/rout_names.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/input_field.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticAppBar.customAppBar(context, 'Sign up'),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode(),);
        },
        child: Container(
            padding: const EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: whiteColor,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 14, bottom: 20),
                        child: Text(
                          'Create password',
                          style: TextStyle(
                            color: blackTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF Pro Display',
                            fontSize: 34,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: CustomInputField(
                            hintText: 'Password',
                            textEditingController: passwordController,
                            labelText: 'Password'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: CustomInputField(
                            hintText: 'Confirm password',
                            textEditingController: confirmPasswordController,
                            labelText: 'Confirm password'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      if(passwordController.text.length >= 8) {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          Get.toNamed(enterName,
                              arguments: [passwordController.text]);
                        }else{
                          Get.snackbar('','Password doesn\'t match!');
                        }
                      }else{
                        Get.snackbar('','Password length must be at least 8 characters!');
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
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
            )),
      ),
    );
  }
}
