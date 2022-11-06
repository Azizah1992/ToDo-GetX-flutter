import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controlleer/TaskController.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              "Add New Task",
              style: text.headline5,
            ),
            const Spacer(
              flex: 1,
            ),
            TextField(
              controller: controller.textEditingController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                hintText: "Enter Task Description",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                controller.addTsk();
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 54, 244),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Add Task",
                  style: text.button!.copyWith(color: Colors.white),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      )),
    );
  }
}
