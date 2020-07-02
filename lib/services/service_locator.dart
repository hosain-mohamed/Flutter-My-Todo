import 'package:clean_architecture/services/tasks/storage_repository.dart';
import 'package:clean_architecture/services/tasks/shared_pref_implementation.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  serviceLocator.registerLazySingleton<StorageRepository>(() => SharedPrefImpl());
}
