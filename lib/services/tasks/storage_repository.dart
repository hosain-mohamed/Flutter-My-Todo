import 'package:clean_architecture/business_logic/models/task.dart';

abstract class StorageRepository {
  Future<List<Task>> getAllTasks();
  void saveAllTasks(List<Task> tasks);
}
