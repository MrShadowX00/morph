import 'package:flutter/material.dart';

import '../../../../../widgets/app_bar.dart';
import '../../../../../widgets/custom_bottom_bar.dart';



class ThisMonthScreen extends StatefulWidget {
  const ThisMonthScreen({Key? key}) : super(key: key);

  @override
  State<ThisMonthScreen> createState() => _ThisMonthScreenState();
}

class _ThisMonthScreenState extends State<ThisMonthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StaticAppBar.homeAppBar(context, 'Todo', false, ''),
      body: ListView(
        children: const [],
      ),
      floatingActionButton: CustomBottomBar.customFloatingActionButton(),
      bottomNavigationBar: CustomBottomBar.customBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
