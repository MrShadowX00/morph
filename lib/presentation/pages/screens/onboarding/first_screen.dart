import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../utils/style/colors.dart';
import '../../../routers/rout_names.dart';
import '../../../widgets/default_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(image: AssetImage('assets/images/3x/language_logo.png'),fit: BoxFit.cover)
              ),
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
              'Control your life\'s journey all in one place',
              style: TextStyle(
                color: blackTextColor,
                fontSize: 22,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 5,
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
                      )),
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
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'English',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
                      color: blueColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 1,
                    height: 16,
                    color: greyTextColor.withOpacity(0.5),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Spanish',
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
                      color: greyTextColor,
                    ),
                  ),
                )
              ],
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
              route: second,
              ctx: context,
              arg: const {},
            ),
          ),
        ],
      ),
    );
  }
}

