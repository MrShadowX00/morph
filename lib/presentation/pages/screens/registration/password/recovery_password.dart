import 'package:flutter/material.dart';
import '../../../../../utils/style/colors.dart';
import '../../../../routers/rout_names.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/input_field.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({Key? key}) : super(key: key);

  @override
  State<RecoveryPasswordScreen> createState() => _RecoveryPasswordScreenState();
}

class _RecoveryPasswordScreenState extends State<RecoveryPasswordScreen> {
  TextEditingController emailOrPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticAppBar.customAppBar(context,'Log in'),
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
                        padding: EdgeInsets.only(top: 14, bottom: 4),
                        child: Text(
                          'Recovery password',
                          style: TextStyle(
                            color: blackTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF Pro Display',
                            fontSize: 34,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Please enter your E-mail or phone number and we will send you verification code',
                          style: TextStyle(
                            color: hintTextColor,
                            fontFamily: 'SF Pro Display',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      CustomInputField(
                          hintText: 'E-mail or phone number',
                          textEditingController: emailOrPhoneController,
                          labelText: 'E-mail or phone')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: DefaultButton(
                    text: 'Continue',
                    route: codeVerification,
                    ctx: context,
                    arg: {
                      1: emailOrPhoneController.value.text,
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
