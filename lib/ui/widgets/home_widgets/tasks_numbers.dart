import 'package:clean_architecture/ui/utils/device_config.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:clean_architecture/business_logic/view_models/task_model.dart';

class TasksNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var device = DeviceData.init(context);
    return Consumer<TaskModel>(
      builder: (BuildContext context, taskModel, Widget child) {
        return Text(
          "${taskModel.getListCount()} tasks",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: device.screenHeight * 0.02,
          ),
        );
      },
    );
  }
}
