import 'package:flutter/material.dart';

import '../../../../utils/style/colors.dart';
import '../../../routers/rout_names.dart';
import '../../../widgets/agenda_menu_item.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/todo_single_widget.dart';



class AgendaScreen extends StatefulWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticAppBar.homeAppBar(context, 'Agenda', false, ''),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
             TodoSingleWidget(
               color: todayColor,
               title: 'To do',
               count: 0,
               func: (){
                 Navigator.pushNamed(context, todo);
                 },
             ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: AgendaMenuItem(
                  ctx: context,
                  iconImage: 'assets/icons/meetup_widget_icon.png',

                  isGradient: false,
                  route: '',
                  title: 'Work',
                  bgColor: workColor,
                ),),
                const SizedBox(width: 10,),
                Expanded(child: AgendaMenuItem(
                  ctx: context,
                  iconImage: 'assets/icons/special_occasions_widget_icon.png',

                  isGradient: false,
                  route: '',
                  title: 'Finances',
                  bgColor: financeColor,
                ),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: AgendaMenuItem(
                  iconImage: 'assets/icons/selfcare_widget_icon.png',

                  ctx: context,
                  isGradient: false,
                  route: '',
                  title: 'Travel',
                  bgColor: travelColor,
                ),),
                const SizedBox(width: 10,),
                Expanded(child: AgendaMenuItem(
                  iconImage: 'assets/icons/travel_widget_icon.png',

                  ctx: context,
                  isGradient: false,
                  route: '',
                  title: 'Self care',
                  bgColor: selfCareColor,
                ),),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: AgendaMenuItem(
                  iconImage: 'assets/icons/finance_widget_icon.png',

                  ctx: context,
                  isGradient: true,
                  route: '',
                  title: 'Special Occasions',
                  linearGradient: specialOccasionColor,
                ),),
                const SizedBox(width: 10,),
                Expanded(child: AgendaMenuItem(
                  iconImage: 'assets/icons/work_widget_icon.png',
                  ctx: context,
                  isGradient: false,
                  route: '',
                  title: 'Meet up',
                  bgColor: meetUpColor,
                ),),
              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
        // floatingActionButton: CustomBottomBar.customFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomBar.customBottomBar()
    );
  }
}
