import 'package:clean_architecture/business_logic/view_models/task_model.dart';
import 'package:flutter/material.dart';
import 'tasks_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';

class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return Consumer<TaskModel>(
      builder: (BuildContext context, TaskModel taskModel, Widget child) {
          return taskModel.getListCount() == 0
                  ? buildNoTasksText(deviceData)
                  : buildListView(deviceData, taskModel);
      },
    );
  }

  Center buildNoTasksText(DeviceData deviceData) {
    return Center(
      child: Text(
        "You dont have Tasks ..",
        style: TextStyle(
          color: Colors.grey,
          fontSize: deviceData.screenHeight * 0.022,
        ),
      ),
    );
  }

  Center buildLoadingText(DeviceData deviceData) {
    return Center(
      child: Text(
        "Wating ..",
        style: TextStyle(
          color: Colors.grey,
          fontSize: deviceData.screenHeight * 0.022,
        ),
      ),
    );
  }

  Padding buildListView(DeviceData deviceData, TaskModel taskModel) {
    return Padding(
      padding: EdgeInsets.only(
          left: deviceData.screenWidth * 0.1,
          right: deviceData.screenWidth * 0.03,
          top: deviceData.screenHeight * 0.04,
          bottom: deviceData.screenHeight * 0.02),
      child: ListView.builder(
        itemCount: taskModel.getListCount(),
        itemBuilder: (BuildContext context, int index) {
          return TasksListTile(
            checkTask: () => taskModel.checkTask(index),
            isDone: taskModel.tasks[index].isDone,
            removeTask: () => taskModel.removeTask(index),
            taskTitle: taskModel.tasks[index].name,
          );
        },
      ),
    );
  }
}
