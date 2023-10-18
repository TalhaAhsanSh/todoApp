import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/AppConstants/app_colors.dart';
import 'package:todolist/AppConstants/app_fonts.dart';
import 'package:todolist/Controller/to_do_controller.dart';

import '../Component/todo_list_item.dart';
import '../Routes/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final ToDoController toDoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    //toDoController.list = _prefs.getStringList('items');
    return Scaffold(
      backgroundColor: AppColors.blackVariant.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, right: 20),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.toDoListScreen,
                      arguments: {'isAdding': true, 'value': "", 'index': -1});
                },
                child: Icon(Icons.add),
                backgroundColor: AppColors.grayishBlack,
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    toDoController.day,
                    style: AppFonts.heading,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 31),
                    alignment: Alignment.center,
                    child: Text(
                        '${toDoController.todayDay} ${toDoController.monthName}',
                        style: AppFonts.heading.copyWith(
                          color: AppColors.blackVariant,
                          fontSize: 45,
                          letterSpacing: 4,
                        )))
              ],
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: Text('TO DO LIST',
                    style: AppFonts.heading.copyWith(
                      color: AppColors.grayishBlack,
                      fontSize: 50,
                    ))),
            Expanded(
              child: Obx(() {
                final list = toDoController.list; // Extract the RxList<String>
                return list.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ToDoListItem(
                            listWork: list[index],
                            // Use list[index] instead of toDoController.list[index]
                            index: index,
                            toDoController: toDoController,
                          );
                        },
                        itemCount: list
                            .length, // Use list.length instead of toDoController.list.length
                      )
                    : Center(
                        child: Text(
                          "ADD ITEMS TO YOUR TO DO LIST",
                          style: AppFonts.body
                              .copyWith(color: AppColors.grayishBlack),
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
