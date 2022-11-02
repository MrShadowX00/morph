import 'package:flutter/material.dart';
import '../../../../../utils/style/colors.dart';
import '../../../../routers/rout_names.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/input_field.dart';



class CodeVerificationScreen extends StatefulWidget {
  final String email;

  const CodeVerificationScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  TextEditingController verificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: StaticAppBar.customAppBar(context, 'Log in'),
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
                        'Please enter the code that we\'ve sent',
                        style: TextStyle(
                          color: hintTextColor,
                          fontFamily: 'SF Pro Display',
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          widget.email,
                          style: const TextStyle(
                            color: blackTextColor,
                            fontFamily: 'SF Pro Display',
                            fontSize: 15,
                          ),
                        ),
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
                            child: const Center(
                              child: Text(
                                '0:59',
                                style: TextStyle(
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
                          child: DefaultButton(
                            text: 'Continue',
                            route: resetPass,
                            ctx: context,
                            arg: const {},
                          ),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
