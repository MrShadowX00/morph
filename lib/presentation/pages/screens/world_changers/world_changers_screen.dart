import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/style/colors.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';

class WorldChangersScreen extends StatefulWidget {
  const WorldChangersScreen({Key? key}) : super(key: key);

  @override
  State<WorldChangersScreen> createState() => _WorldChangersScreenState();
}

class _WorldChangersScreenState extends State<WorldChangersScreen> {

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
    // if (!await launchUrl(uri)) {
    //   throw 'Could not launch $url';
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticAppBar.homeAppBar(context, 'World Changers', false, ''),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 30,
              bottom: 20,
            ),
            child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/world_changers_landing.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 80, bottom: 8),
            child: Text(
              'You are changing the world!',
              style: TextStyle(
                color: blackTextColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
                fontSize: 34,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Text(
              'Your membership helps to support the following foundations:',
              style: TextStyle(
                color: hintTextColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Text(
              'Thank you! You make a difference!',
              style: TextStyle(
                color: hintTextColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Display',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/icons/world_reload.png'),
                  height: 80,
                  width: 80,
                )),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: GestureDetector(
              onTap: (){
                _launchUrl('https://carbon180.org/');
              },
              child: const Text(
                'https://carbon180.org',
                style: TextStyle(
                  color: blackTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/icons/behind.png'),
                  height: 60,
                  width: 130,
                )),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
            child: GestureDetector(
              onTap: (){
                _launchUrl('https://puppiesbehindbars.com/');
              },
              child:const  Text(
                'https://puppiesbehindbars.com/',
                style: TextStyle(
                  color: blackTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomBottomBar.customFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomBar.customBottomBar()
    );
  }
}
