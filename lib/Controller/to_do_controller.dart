import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoController extends GetxController {
  var todayDay = DateTime.now().day;
  var todayDate = DateTime.now();
  TextEditingController textEditingController = TextEditingController();
  var monthName;
  var dayOfWeek;
  var day;

  final RxList<String> list = <String>[].obs;

// Storing the list in SharedPreferences
  void saveListToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final listToStore = list.toList(); // Convert RxList to List<String>
    await prefs.setStringList('todoList', listToStore);
  }

// Retrieving the list from SharedPreferences
  void getListFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final listFromPrefs = prefs.getStringList('todoList') ?? [];
    list.assignAll(listFromPrefs); // Update the RxList with the retrieved data
  }

  @override
  void onInit() {
    super.onInit();
    monthName = DateFormat.MMM().format(todayDate).toUpperCase();
    dayOfWeek = todayDate.weekday;
    day = getDayName(dayOfWeek);
    getListFromSharedPreferences();
  }

  String getDayName(int dayOfWeek) {
    switch (dayOfWeek) {
      case 1:
        return 'MONDAY';
      case 2:
        return 'TUESDAY';
      case 3:
        return 'WEDNESDAY';
      case 4:
        return 'THURSDAY';
      case 5:
        return 'FRIDAY';
      case 6:
        return 'SATURDAY';
      case 7:
        return 'SUNDAY';
      default:
        return '';
    }
  }
}
