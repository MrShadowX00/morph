import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:morphzing/data/models/journal/journal_streak_model.dart';
import 'package:morphzing/data/repositories/journal/journal_repositories.dart';

class JournalController extends GetxController{
  RxBool loading = false.obs;
  RxInt  totalEntries = 0.obs;
  RxInt  currentStreak = 0.obs;
  RxInt  weeksJournaling = 0.obs;
  final box = GetStorage();


  getStats() async{
    // box.remove('token');
    loading.value = true;
    try {
      var result = await JournalRepositories.getJournalStats(
        box.read('token').toString(),);
      if (result.statusCode == 200) {
        var streakModel = JournalStreakModel.fromJson(
          jsonDecode(result.toString(),),);
        totalEntries.value = streakModel.totalEntries;
        currentStreak.value = streakModel.streakCount;
        weeksJournaling.value = streakModel.weekStreak;
      }
    }catch(e){}
    loading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getStats();
  }



}