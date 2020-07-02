import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/utils/constants.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';

class TasksListTile extends StatelessWidget {
  const TasksListTile({
    Key key,
    @required this.taskTitle,
    @required this.isDone,
    @required this.checkTask,
    @required this.removeTask,
    
  }) : super(key: key);

  final String taskTitle;
  final bool isDone;
  final Function checkTask ;
  final Function removeTask ;
  
  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
          color: Colors.grey[700],
          fontSize: deviceData.screenHeight * 0.022,
        ),
      ),
      trailing: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              value: isDone,
              onChanged: (value) => checkTask(),
              activeColor: kAccentColor,
            ),
            FlatButton(
              onPressed: () => removeTask(),
              child: Icon(
                Icons.delete,
                size: deviceData.screenWidth * 0.07,
                color: kAccentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
