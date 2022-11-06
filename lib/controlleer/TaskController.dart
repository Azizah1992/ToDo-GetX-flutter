import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/model/Task.dart';

class TaskController extends GetxController {
  //handel add and delete task

  final _taskList = <Task>[]
      .obs; //list to save the task//obs when you add it with any varible its become observable

  List<Task> get tasklist => _taskList.value;

  TextEditingController? textEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController!.clear();
  }

  void addTsk() {
    String txt = textEditingController!.text;
    DateTime time = DateTime.now();

    _taskList.add(Task(txt, time.day.toString()));
    textEditingController!.text = "";
  }

  void deleteTask(Task task) {
    tasklist.remove(task);
  }
}
