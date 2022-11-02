import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphzing/core/constants/style.dart';
import 'package:morphzing/logic/controllers/journal/journey_controller.dart';
import 'package:morphzing/presentation/routers/rout_names.dart';
import 'package:morphzing/utils/style/colors.dart';

class MultipleImageViewWidget extends StatefulWidget {
  const MultipleImageViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MultipleImageViewWidget> createState() =>
      _MultipleImageViewWidgetState();
}

class _MultipleImageViewWidgetState extends State<MultipleImageViewWidget> {
  JourneyController journeyController = Get.put(
    JourneyController(),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Get.toNamed(allImages);
      },
      child: Obx(() {
        if (journeyController.images.length == 1) {
          return SizedBox(
            height: 250,
            width: Get.width,
            child: Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: Get.width,
                  child: Image.file(
                    journeyController.images[0],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 200,
                  width: Get.width,
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.more_vert,
                          color: whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (journeyController.images.length == 2) {
          return SizedBox(
            height: 420,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: Get.width,
                        child: Image.file(
                          journeyController.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 200,
                        width: Get.width,
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.more_vert,
                                color: whiteColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.file(
                        journeyController.images[1],
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Container()),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Container()),
                  ],
                )
              ],
            ),
          );
        } else if (journeyController.images.length == 3) {
          return SizedBox(
            height: 420,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: Get.width,
                        child: Image.file(journeyController.images[0],
                            fit: BoxFit.cover),
                      ),
                      Container(
                        height: 200,
                        width: Get.width,
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.more_vert,
                                color: whiteColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Image.file(
                      journeyController.images[1],
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Image.file(
                        journeyController.images[2],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Container()),
                  ],
                )
              ],
            ),
          );
        } else if (journeyController.images.length == 4) {
          return SizedBox(
            height: 420,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: Get.width,
                        child: Image.file(
                          journeyController.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 200,
                        width: Get.width,
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.more_vert,
                                color: whiteColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.file(
                        journeyController.images[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Image.file(
                        journeyController.images[2],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Image.file(
                        journeyController.images[3],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (journeyController.images.length > 4) {
          return SizedBox(
            height: 420,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  width: Get.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 250,
                        width: Get.width,
                        child: Image.file(
                          journeyController.images[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 200,
                        width: Get.width,
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.more_vert,
                                color: whiteColor,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        child: Image.file(
                          journeyController.images[1],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 120,
                        child: Image.file(
                          journeyController.images[2],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: Image.file(
                            journeyController.images[3],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 120,
                          color: Colors.black.withOpacity(0.3),
                          child: Center(
                            child: Text(
                              '+${journeyController.images.length - 4}',
                              style: staticTextStyle(
                                22,
                                whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}
