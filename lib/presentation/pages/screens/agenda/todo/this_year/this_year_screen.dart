import 'package:flutter/material.dart';

import '../../../../../widgets/app_bar.dart';
import '../../../../../widgets/custom_bottom_bar.dart';




class ThisYearScreen extends StatefulWidget {
  const ThisYearScreen({Key? key}) : super(key: key);

  @override
  State<ThisYearScreen> createState() => _ThisYearScreenState();
}

class _ThisYearScreenState extends State<ThisYearScreen> {
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
