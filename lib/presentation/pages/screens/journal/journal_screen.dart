import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:morphzing/core/constants/style.dart';
import 'package:morphzing/presentation/widgets/app_bar.dart';
import 'package:morphzing/presentation/widgets/custom_bottom_bar.dart';
import 'package:morphzing/utils/style/colors.dart';

import '../../../../logic/controllers/journal/journal_controller.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final journalController = Get.put(
    JournalController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: StaticAppBar.homeAppBar(context, 'Journal', false, ''),
      body: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 16,
                ),
                child: Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFD9271D),
                      Color(0xFFE67817),
                      Color(0xFFFFF701),
                      Color(0xFF84C428),
                      Color(0xFF76C5F0),
                      Color(0xFF8F1E78),
                    ]),
                  ),
                  child: Center(
                    child: Text(
                      'Today\'s Journey',
                      style: staticTextStyle(
                        16,
                        whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 2,
                color: greyTextColor,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${journalController.totalEntries.value}',
                          style: staticTextStyle(
                            18,
                            travelColor,
                          ),
                        ),
                        Text(
                          'Total Entries',
                          style: staticTextStyle(
                            12,
                            greyTextColor,
                          ),
                        ),
                      ],
                    )),
                    Container(
                      height: 30,
                      width: 1,
                      color: greyTextColor,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${journalController.currentStreak.value}',
                          style: staticTextStyle(
                            18,
                            travelColor,
                          ),
                        ),
                        Text(
                          'Current Streak',
                          style: staticTextStyle(
                            12,
                            greyTextColor,
                          ),
                        ),
                      ],
                    )),
                    Container(
                      height: 30,
                      width: 1,
                      color: greyTextColor,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${journalController.weeksJournaling.value}',
                          style: staticTextStyle(
                            18,
                            travelColor,
                          ),
                        ),
                        Text(
                          'Weeks Journaling',
                          style: staticTextStyle(
                            12,
                            greyTextColor,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              const Divider(
                height: 2,
                color: greyTextColor,
              ),
              Expanded(
                child: Center(
                  child: (journalController.loading.value)
                      ? const CircularProgressIndicator()
                      : Text(
                          'No Journey for today',
                          style: staticTextStyle(
                            22,
                            greyTextColor,
                          ),
                        ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CustomBottomBar.customJournalBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomBottomBar.customFloatingActionButton(),
    );
  }



}
