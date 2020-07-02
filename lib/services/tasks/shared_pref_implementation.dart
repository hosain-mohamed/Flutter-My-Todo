import 'package:clean_architecture/business_logic/models/task.dart';
import 'package:clean_architecture/services/tasks/storage_repository.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefImpl implements StorageRepository {
  static const sharedPrefTasksKey = "TASKS_KEY";

  @override
  Future<List<Task>> getAllTasks() async {
    String tasksJsonString = await _getFromSharedPref(sharedPrefTasksKey);
    List<Task> tasks = _deserializeTasks(tasksJsonString);
    return Future.delayed(Duration(milliseconds: 150), () => tasks);
  }

  @override
  void saveAllTasks(List<Task> tasks) {
    String tasksJsonString = _serializeTasks(tasks);
    _saveToSharedPref(sharedPrefTasksKey, tasksJsonString);
  }

  String _serializeTasks(List<Task> tasks) {
    return jsonEncode(tasks);
  }

  Future<void> _saveToSharedPref(String key, String value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(key, value);
  }

  List<Task> _deserializeTasks(String jsonString) {
    List<Task> tasks = [];
    if (jsonString == '') return tasks;
    final taskMapList = jsonDecode(jsonString);
    for (Map taskMap in taskMapList) {
      Task task = Task.fromjson(taskMap);
      tasks.add(task);
    }
    return tasks;
  }

  Future<String> _getFromSharedPref(String key) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String value = sharedPref.getString(key) ?? '';
    return value;
  }

}
