import 'package:flutter/material.dart';
import '../../../../../utils/style/colors.dart';
import '../../../../routers/rout_names.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/input_field.dart';



class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

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
                            hintText: 'New password',
                            textEditingController: newPasswordController,
                            labelText: 'New password'),
                      ),
                      CustomInputField(
                          hintText: 'Confirm password',
                          textEditingController: newPasswordController,
                          labelText: 'Confirm password'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: DefaultButton(
                    text: 'Continue',
                    route: login,
                    ctx: context,
                    arg: const {},
                  ),
                )
              ],
            )),
      ),
    );
  }
}
