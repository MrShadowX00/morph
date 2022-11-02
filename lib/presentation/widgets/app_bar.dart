import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/style/colors.dart';
import '../pages/screens/home_screen.dart';


class StaticAppBar {
  static AppBar customAppBar(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: blackTextColor,
        ),
      ),
      backgroundColor: bgColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: blackTextColor,
          fontFamily: 'SF Pro Display',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static AppBar homeAppBar(
      BuildContext context, String title, bool isHome, String image) {
    return AppBar(
      elevation: 1,
      leading: (isHome)
          ? IconButton(
              onPressed: () {
                HomeScreen.homeKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: blackTextColor,
              ),
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: blackTextColor,
              ),
            ),
      backgroundColor: bgColor,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: blackTextColor,
          fontFamily: 'SF Pro Display',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Center(
            child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset('assets/icons/premium.svg')),
          ),
        ),
        const SizedBox(width: 20,),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: blueColor),
                  child: (image == '')
                      ? const Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 26,
                          ),
                        )
                      : CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(image),
                        ),
                ),
              )),
        ),

      ],
    );
  }
}
