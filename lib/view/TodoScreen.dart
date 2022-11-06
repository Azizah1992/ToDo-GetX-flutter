// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controlleer/TaskController.dart';
import 'package:myapp/view/AddTaskScreen.dart';
import 'TaskTile.dart';
// import library 'TaskTile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(AddTaskScreen());
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(255, 214, 142, 166),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Obx(
        () => (controller.tasklist.isEmpty)
            ? Center(
                child: Text(
                  "click add to insert your task",
                  style: text.headline5,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // child: TaskTile(size: size, text: text),
                child: ListView.builder(
                  itemCount: controller.tasklist.length,
                  itemBuilder: (context, index) => TaskTile(
                      size: size,
                      text: text,
                      time: controller.tasklist[index].taskCreated,
                      des: controller.tasklist[index].task,
                      press: () {
                        controller.deleteTask(controller.tasklist[index]);
                      }),
                ),
              ),
      )),
    );
  }
}
