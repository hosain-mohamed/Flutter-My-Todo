import 'dart:collection';

import 'package:clean_architecture/business_logic/models/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:clean_architecture/services/tasks/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/services/service_locator.dart';

class TaskModel extends ChangeNotifier {
  final StorageRepository tasksStorage = serviceLocator<StorageRepository>();
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks  => UnmodifiableListView(_tasks);

  Future<List<Task>> loadTasks() async{
    _tasks = await tasksStorage.getAllTasks();
    notifyListeners();
    return _tasks;
  }

  int getListCount(){
    return _tasks.length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    tasksStorage.saveAllTasks(_tasks);
    notifyListeners();
  }

  void removeTask(int taskIndex) {
    _tasks.removeAt(taskIndex);
    tasksStorage.saveAllTasks(_tasks);
    notifyListeners();
  }

  void checkTask(int taskIndex) {
    _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
    tasksStorage.saveAllTasks(_tasks);
    notifyListeners();
  }

}
