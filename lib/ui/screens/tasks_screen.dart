import 'package:clean_architecture/business_logic/models/task.dart';
import 'package:clean_architecture/ui/utils/constants.dart';
import 'package:clean_architecture/business_logic/view_models/task_model.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/widgets/home_widgets/floating_action_button.dart';
import 'package:clean_architecture/ui/widgets/home_widgets/body.dart';
import 'package:clean_architecture/ui/widgets/home_widgets/header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final TaskModel taskmodel = TaskModel();

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return FutureBuilder(
      future: taskmodel.loadTasks(),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.hasData) {
          return buildLoadedScreen();
        } else {
          return buildLoadingScreen(deviceData);
        }
      },
    );
  }

  ChangeNotifierProvider<TaskModel> buildLoadedScreen() {
    return ChangeNotifierProvider<TaskModel>(
      create: (BuildContext context) => taskmodel,
      child: Scaffold(
        floatingActionButton: FloatingButton(),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: kAccentColor,
            child: Stack(
              children: <Widget>[
                Header(),
                Body(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Scaffold buildLoadingScreen(DeviceData deviceData) {
  return Scaffold(
      body: SafeArea(
    child: Container(
      width: double.infinity,
      color: kAccentColor,
      child: Center(
        child: Text(
          "My Todo",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: deviceData.screenHeight * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ));
}
