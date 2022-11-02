import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:morphzing/presentation/routers/rout_names.dart';

import '../../utils/style/colors.dart';
class CustomBottomBar {
  static customFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: blueColor,
      onPressed: () {
        Get.toNamed(journey);
      },
      child: const Icon(
        Icons.add,
        size: 40,
      ),
    );
  }
  static agendaFloatingActionButton({required BuildContext context, Color? color, required Widget child}) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return child;
              });
      },
      backgroundColor: color ,
      child: const Icon(
        Icons.add,
        size: 40,
      ),
    );
  }

  static customBottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(home);
                },
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: SvgPicture.asset(
                    'assets/icons/leading_icon.svg',
                    color: hintTextColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16,
              ),
              child: GestureDetector(
                onTap: () {},
                child: const SizedBox(
                  height: 36,
                  width: 36,
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: hintTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   static customJournalBottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(home);
                },
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: SvgPicture.asset(
                    'assets/icons/leading_icon.svg',
                    color: hintTextColor,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.event_note,
                        size: 30,
                        color: hintTextColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const SizedBox(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.sticky_note_2_rounded,
                        size: 30,
                        color: hintTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
