import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../utils/style/colors.dart';
import '../../../../../widgets/app_bar.dart';
import '../../../../../widgets/custom_bottom_bar.dart';


class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime lastDay = DateTime(2023);
  DateTime startDay = DateTime.now();
  final _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: StaticAppBar.homeAppBar(context, 'Todo', false, ''),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20,
              ),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '14 tasks',
                          style: TextStyle(
                            color: hintTextColor,
                            fontFamily: 'SF Pro Display',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'March 27, 2022',
                          style: TextStyle(
                            color: blackTextColor,
                            fontFamily: 'SF Pro Display',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showCalendar();
                      },
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: greyButton,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          'assets/icons/calendar_btn.svg',
                          height: 16,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _addDateBar(),
            _typeBar(),
          ],
        ),
        floatingActionButton: CustomBottomBar.agendaFloatingActionButton(
          color: todayColor,
          context: context,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bgColor,
                      ),
                      child: const Icon(CupertinoIcons.clear,color: hintTextColor,size: 16,),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:5,),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: textEditingController,
                      obscureText: false,
                      style: const TextStyle(
                          fontSize: 34,
                          fontFamily: 'SF Pro Display',
                          color: hintTextColor
                      ),
                      decoration:const InputDecoration(
                          hintText: 'Task name',
                          hintStyle:  TextStyle(
                              fontSize: 34,
                              fontFamily: 'SF Pro Display',
                              color: hintTextColor
                          )
                      ),
                    ),
                  ),
                ),
                const Padding(
                 padding:  EdgeInsets.only(top: 20,),
                 child:  Text('Time',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      color: blackTextColor,
                      fontWeight: FontWeight.bold
                  ),),
               )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar.customBottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  _typeBar() {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: todayColor,
                labelColor: todayColor,
                labelStyle: const TextStyle(
                  color: todayColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                ),
                unselectedLabelColor: hintTextColor,
                tabs: [
                  const Tab(
                    text: 'All',
                  ),
                  const Tab(
                    text: 'To Do',
                  ),
                  Tab(
                    child: Row(
                      children: const [
                        Text('Goals'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  const Tab(
                    text: 'Done',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: todayColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: todayColor,
          selectedTextColor: whiteColor,
          dateTextStyle: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 14,
            color: greyTextColor,
          ),
          dayTextStyle: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 14,
            color: greyTextColor,
          ),
          monthTextStyle: const TextStyle(
            fontFamily: 'SeF Pro Display',
            fontSize: 14,
            color: greyTextColor,
          ),
          locale: "en-En",
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),
      ),
    );
  }

  showCalendar() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Calendar',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.now(),
                lastDay: lastDay,
                headerStyle: const HeaderStyle(
                  rightChevronPadding: EdgeInsets.all(4),
                  leftChevronPadding: EdgeInsets.all(4),
                  titleTextStyle: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: todayColor,
                  ),
                  rightChevronIcon: Icon(
                    Icons.arrow_forward_ios,
                    color: todayColor,
                  ),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios,
                    color: todayColor,
                  ),
                  formatButtonVisible: false,
                  formatButtonShowsNext: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                    disabledTextStyle: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: hintTextColor,
                    ),
                    defaultTextStyle: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: blackTextColor,
                    ),
                    outsideDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    weekendDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    defaultDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    outsideTextStyle: const TextStyle(
                      color: hintTextColor,
                    ),
                    weekendTextStyle: const TextStyle(color: greyTextColor),
                    selectedDecoration: BoxDecoration(
                      // shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: todayColor,
                    ),
                    markerMargin: const EdgeInsets.only(top: 10),
                    markerDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    )),
                calendarFormat: _calendarFormat,
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: hintTextColor),
                    weekendStyle: TextStyle(color: hintTextColor)),
                onDaySelected: (selectedDay, focusedDay) {
                  selectedDay = selectedDay;
                  focusedDay = focusedDay; // update `_focusedDay` here as well
                },
              ),
              calendarButton(
                'Continue',
                todayColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  calendarButton(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
