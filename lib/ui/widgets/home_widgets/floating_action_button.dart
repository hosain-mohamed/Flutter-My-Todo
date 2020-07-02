import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/utils/constants.dart';
import 'bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:clean_architecture/business_logic/view_models/task_model.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskModel = Provider.of<TaskModel>(context);
    return FloatingActionButton(
      backgroundColor: kAccentColor,
      onPressed: () => buildBottomSheet(context, taskModel),
      child: Icon(Icons.add),
    );
  }

  Future buildBottomSheet(BuildContext context, TaskModel taskModel) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ChangeNotifierProvider.value(value: taskModel,child:AddTaskSheet()),
    );
  }
}
