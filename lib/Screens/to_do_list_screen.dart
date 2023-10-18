import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/AppConstants/app_colors.dart';
import 'package:todolist/AppConstants/app_fonts.dart';
import 'package:todolist/Controller/to_do_controller.dart';

class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    final isAdded = arguments['isAdding'];
    final value = arguments['value'];
    final index = arguments['index'];
    final ToDoController toDoController = Get.find();
    toDoController.textEditingController.text = value;
    return Scaffold(
      backgroundColor: AppColors.blackVariant.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: Text(isAdded ? 'ADD TO LIST' : 'UPDATE LIST ITEM',
                    style: AppFonts.heading.copyWith(
                      color: AppColors.grayishBlack,
                      fontSize: 50,
                    ))),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grayishBlack),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  controller: toDoController.textEditingController,
                  style: AppFonts.body,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, right: 20, bottom: 20),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () {
                  if (toDoController.textEditingController.text != "" &&
                      index == -1) {
                    toDoController.list
                        .add(toDoController.textEditingController.text);
                    toDoController.saveListToSharedPreferences();
                  } else if (toDoController.textEditingController.text != "") {
                    toDoController.list[index] =
                        toDoController.textEditingController.text;
                    toDoController.saveListToSharedPreferences();
                  }

                  Get.back();
                },
                backgroundColor: AppColors.grayishBlack,
                child: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
