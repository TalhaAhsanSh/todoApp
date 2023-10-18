import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppConstants/app_colors.dart';
import '../AppConstants/app_fonts.dart';
import '../Controller/to_do_controller.dart';
import '../Routes/routes.dart';

class ToDoListItem extends StatelessWidget {
  final String listWork;
  final int index;
  final ToDoController toDoController;

  const ToDoListItem({
    super.key,
    required this.listWork,
    required this.index,
    required this.toDoController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayishBlack),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.toDoListScreen, arguments: {
                  'isAdding': false,
                  'value': listWork,
                  'index': index
                });
              },
              child: Text(
                listWork,
                style: AppFonts.body,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              toDoController.list.removeAt(index);
              toDoController.saveListToSharedPreferences();
            },
            child: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
