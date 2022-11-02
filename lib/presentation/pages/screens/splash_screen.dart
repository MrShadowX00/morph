import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/style/colors.dart';
import '../../routers/rout_names.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  void goNext() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    var token = box.read('token');
    if(token != null){
      Get.offAllNamed(home);
    }else {
      Get.offAllNamed(first);
    }
  }

  @override
  void initState() {
    goNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.height / 2,
              child: const Center(
                child: Image(
                  image: AssetImage(
                    "assets/icons/app_icon.png",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  "MorphZing",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "SF Pro Display",
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
