import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/style/colors.dart';
import '../../../routers/rout_names.dart';
import '../../../widgets/default_button.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(),
              flex: 2,
            ),
            Expanded(
              flex: 3,
                child: Center(
              child: SvgPicture.asset(
                'assets/icons/leading_icon.svg',
                color: Colors.grey.withOpacity(0.5),
              ),
            )),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/3x/intro_first_image.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30.0,
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                'Use your journal to:',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 20,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 3,
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                '- Track your progress',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                '- Find inspiration',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                '- Gain self-confidence',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                '- Strengthen memory',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                '- Write down your goals',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 5,
              ),
              child: Text(
                '- Track progress and growth',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 25,
              ),
              child: Text(
                '- Improve writing and communication skills',
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
                left: 30,
                right: 30,
              ),
              child: DefaultButton(
                text: 'Next',
                route: third,
                ctx: context,
                arg: const {},
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
