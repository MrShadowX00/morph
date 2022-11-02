import 'package:flutter/material.dart';

import '../../../../../utils/style/colors.dart';
import '../../../../routers/rout_names.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_bottom_bar.dart';
import '../../../../widgets/todo_single_widget.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: StaticAppBar.homeAppBar(context, 'Todo', false, ''),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    const SizedBox(height: 20,),
                    TodoSingleWidget(
                      title: 'Today',
                      func: () {
                        Navigator.pushNamed(context, today,);
                      },
                      count: 0,
                      color: todayColor,
                    ),
                    const SizedBox(height: 10,),

                    TodoSingleWidget(
                      title: 'This month',
                      func: () {
                        Navigator.pushNamed(context, thisMonth,);

                      },
                      count: 0,
                      color: thisMonthColor,
                    ),
                    const SizedBox(height: 10,),

                    TodoSingleWidget(
                      title: 'This year',
                      func: () {
                        Navigator.pushNamed(context, thisYear,);
                      },
                      count: 0,
                      color: thisYearColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: CustomBottomBar.customFloatingActionButton(),
        bottomNavigationBar: CustomBottomBar.customBottomBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


}
