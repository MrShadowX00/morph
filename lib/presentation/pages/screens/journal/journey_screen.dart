import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:morphzing/core/constants/style.dart';
import 'package:morphzing/logic/controllers/journal/journey_controller.dart';
import 'package:morphzing/presentation/routers/rout_names.dart';
import 'package:morphzing/presentation/widgets/journal/audio_bottomsheet_widget.dart';
import 'package:morphzing/presentation/widgets/journal/journey_bottomsheet_widget.dart';
import 'package:morphzing/presentation/widgets/journal/multiple_image_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../utils/style/colors.dart';

class JourneyScreen extends StatefulWidget {
  const JourneyScreen({Key? key}) : super(key: key);

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  final journeyController = Get.put(
    JourneyController(),
  );
  TextEditingController journeyTitleController = TextEditingController();
  TextEditingController journeyDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
          'Today\'s Journey',
          style: TextStyle(
            color: blackTextColor,
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () {
          return (journeyController.loading.value)
              ? Container()
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            height: 50,
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat.jm().format(
                                            journeyController.dateTime.value),
                                        style: staticTextStyle(
                                          12,
                                          greyTextColor,
                                        ),
                                      ),
                                      Text(
                                        '${DateFormat.MMMMd().format(journeyController.dateTime.value)}, ${DateFormat.y().format(journeyController.dateTime.value)}',
                                        style: staticTextStyle(
                                          16,
                                          blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        journeyController.isTimeWidget.value =
                                            false;
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: Obx(
                                              () {
                                                if ((journeyController
                                                    .isTimeWidget.value)) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: 220,
                                                    width: Get.width - 30,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Time',
                                                          style:
                                                              staticTextStyle(
                                                            16,
                                                            blackTextColor,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child:
                                                              TimePickerSpinner(
                                                            is24HourMode: false,
                                                            normalTextStyle:
                                                                staticTextStyle(
                                                              20,
                                                              blackTextColor
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            highlightedTextStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                    color:
                                                                        blackTextColor),
                                                            spacing: 20,
                                                            itemHeight: 40,
                                                            isForce2Digits:
                                                                true,
                                                            onTimeChange:
                                                                (time) {
                                                              journeyController
                                                                      .dateTime
                                                                      .value =
                                                                  DateTime(
                                                                journeyController
                                                                    .dateTime
                                                                    .value
                                                                    .year,
                                                                journeyController
                                                                    .dateTime
                                                                    .value
                                                                    .month,
                                                                journeyController
                                                                    .dateTime
                                                                    .value
                                                                    .day,
                                                                time.hour,
                                                                time.minute,
                                                                time.second,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width: Get.width,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color:
                                                                    blueColor),
                                                            child: Center(
                                                              child: Text(
                                                                'Save',
                                                                style:
                                                                    staticTextStyle(
                                                                  16,
                                                                  whiteColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    height: 500,
                                                    width: Get.width - 30,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Calendar',
                                                          style:
                                                              staticTextStyle(
                                                            16,
                                                            blackTextColor,
                                                          ),
                                                        ),
                                                        Obx(() {
                                                          return Expanded(
                                                            child:
                                                                TableCalendar(
                                                              calendarStyle:
                                                                  const CalendarStyle(
                                                                todayDecoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color:
                                                                      blueColor,
                                                                  // borderRadius: BorderRadius.circular(10),
                                                                ),
                                                                // selectedDecoration: BoxDecoration(
                                                                //   color: blueColor,
                                                                //   borderRadius: BorderRadius.circular(10),
                                                                // ),
                                                              ),
                                                              calendarFormat:
                                                                  _calendarFormat,
                                                              headerStyle:
                                                                  HeaderStyle(
                                                                titleTextStyle:
                                                                    staticTextStyle(
                                                                  16,
                                                                  blueColor,
                                                                ),
                                                                formatButtonVisible:
                                                                    false,
                                                                formatButtonShowsNext:
                                                                    false,
                                                                titleCentered:
                                                                    true,
                                                              ),
                                                              onDaySelected:
                                                                  (selectedDay,
                                                                      focusedDay) {
                                                                journeyController
                                                                        .dateTime
                                                                        .value =
                                                                    selectedDay;
                                                                journeyController
                                                                        .focusedDateTime
                                                                        .value =
                                                                    focusedDay;
                                                              },
                                                              currentDay:
                                                                  journeyController
                                                                      .dateTime
                                                                      .value,
                                                              focusedDay:
                                                                  journeyController
                                                                      .focusedDateTime
                                                                      .value,
                                                              firstDay:
                                                                  DateTime.utc(
                                                                      2010,
                                                                      10,
                                                                      16),
                                                              lastDay:
                                                                  DateTime.utc(
                                                                      2040,
                                                                      3,
                                                                      14),
                                                            ),
                                                          );
                                                        }),
                                                        GestureDetector(
                                                          onTap: () {
                                                            journeyController
                                                                .isTimeWidget
                                                                .value = true;
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width: Get.width,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color:
                                                                    blueColor),
                                                            child: Center(
                                                              child: Text(
                                                                'Continue',
                                                                style:
                                                                    staticTextStyle(
                                                                  16,
                                                                  whiteColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.event_note,
                                        color: blueColor,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Divider(
                              height: 1,
                              color: greyTextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: SizedBox(
                              height: 30,
                              width: Get.width,
                              child: TextField(
                                controller: journeyTitleController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Note name',
                                ),
                                style: staticTextStyle(
                                  20,
                                  blackTextColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: greyTextColor.withOpacity(0.3),
                                  )),
                              height: 200,
                              width: Get.width,
                              child: TextField(
                                maxLines: 8,
                                controller: journeyDescriptionController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Descriptions',
                                ),
                                style: staticTextStyle(
                                  14,
                                  blackTextColor,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: MultipleImageViewWidget(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Obx(
                              () {
                                if (journeyController.file != null) {
                                  return Stack(
                                    children: [
                                      SizedBox(
                                        height: 300,
                                        width: Get.width,
                                        child: (journeyController
                                                .paintLoader.value)
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : Image.file(
                                                journeyController.file!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 300,
                                        width: Get.width,
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: blueColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                      )
                                    ],
                                  );
                                } else {
                                  return (journeyController.paintLoader.value)
                                      ? Container()
                                      : Container();
                                }
                              },
                            ),
                          ),
                          Obx((){
                            if(journeyController.recordCompleted.value){
                              return Container(
                                child: AudioFileWaveforms(
                                  playerController: journeyController.playerController,
                                  size: Size(Get.width, 50),
                                ),
                              );
                            }else{
                              return Container();
                            }
                          })

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      color: bgColor,
                      height: 50,
                      width: Get.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: const Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/T.png',
                                    ),
                                    height: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                            color: greyTextColor.withOpacity(0.2),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                  Get.bottomSheet(
                                     const AudioBottomSheetWidget(),
                                   );
                              },
                              child: Container(
                                child: const Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/voice.png',
                                    ),
                                    height: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                            color: greyTextColor.withOpacity(0.2),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(painter);
                              },
                              child: Container(
                                child: const Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/draw.png',
                                    ),
                                    height: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 1,
                            color: greyTextColor.withOpacity(0.2),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  const JourneyBottomSheet(),
                                );
                              },
                              child: Container(
                                child: const Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/extra.png',
                                    ),
                                    height: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
