import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:morphzing/logic/controllers/journal/journey_controller.dart';

import '../../../../utils/style/colors.dart';


class ImageListViewScreen extends StatefulWidget {
  const ImageListViewScreen({Key? key}) : super(key: key);

  @override
  State<ImageListViewScreen> createState() => _ImageListViewScreenState();
}

class _ImageListViewScreenState extends State<ImageListViewScreen> {
  JourneyController journeyController = Get.put(JourneyController());
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blackTextColor,
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
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 26,
                    color: blackTextColor,
                  ),
                )),
          ),
        ],
        backgroundColor: bgColor,
        centerTitle: true,
        title: const Text(
          'Photos',
          style: TextStyle(
            color: blackTextColor,
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx((){
        return Column(
          children: [
            Expanded(child: SizedBox(
              width: Get.width,
              child: PageView(


                // ADD here
                onPageChanged: (index){
                  setState(() {
                  });
                },
              ),
            ),),
            Container(
              height: 100,
              width: Get.width,
            )
          ],
        );
      }),
    );
  }
}
