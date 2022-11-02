import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/style/colors.dart';
import '../../../routers/rout_names.dart';
import '../../../widgets/default_button.dart';



class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

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
                      image: DecorationImage(image: AssetImage('assets/images/3x/intro_second_image.png'),fit: BoxFit.contain)
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                  left: 30,
                  right: 30,
                ),
                child: Text(
                  'Organize',
                  style: TextStyle(
                    color: blackTextColor,
                    fontSize: 24,
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
                ),
                child: Text(
                  'Share',
                  style: TextStyle(
                    color: blackTextColor,
                    fontSize: 24,
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
                ),
                child: Text(
                  'Invite',
                  style: TextStyle(
                    color: blackTextColor,
                    fontSize: 24,
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
                ),
                child: Text(
                  'Chat',
                  style: TextStyle(
                    color: blackTextColor,
                    fontSize: 24,
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
                  bottom: 50,
                ),
                child: Text(
                  'Time Management',
                  style: TextStyle(
                    color: blackTextColor,
                    fontSize: 24,
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
                  text: 'Get started',
                  route: login,
                  ctx: context,
                  arg: const {},
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
