import 'package:clean_architecture/ui/utils/constants.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_architecture/business_logic/view_models/task_model.dart';
import 'package:clean_architecture/business_logic/models/task.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  _AddTaskSheetState createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final TextEditingController inputController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: Color(0xff757575),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(deviceData.screenWidth * 0.1),
              topRight: Radius.circular(deviceData.screenWidth * 0.1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: deviceData.screenHeight * 0.05,
              left: deviceData.screenWidth * 0.2,
              right: deviceData.screenWidth * 0.2,
            ),
            child: Column(
              children: <Widget>[
                InputField(inputController),
                AddButton(inputController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final TextEditingController inputController;
  AddButton(this.inputController);
  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return FlatButton(
        onPressed: () {
          if (inputController.text.length > 0) {
            Provider.of<TaskModel>(context, listen: false)
                .addTask(Task(name: inputController.text));
            inputController.clear();
            Navigator.pop(context);
          }
        },
        child: Icon(
          Icons.add_circle_outline,
          color: kAccentColor,
          size: deviceData.screenWidth * 0.1,
        ));
  }
}

class InputField extends StatelessWidget {
  final TextEditingController inputController;
  InputField(this.inputController);

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return TextField(
      textCapitalization: TextCapitalization.sentences,
        onSubmitted: (value) {
          if (inputController.text.length > 0) {
            Provider.of<TaskModel>(context, listen: false)
                .addTask(Task(name: inputController.text));
            inputController.clear();
            Navigator.pop(context);
          }
        },
        controller: inputController,
        style: TextStyle(
            fontSize: deviceData.screenHeight * 0.025, color: kAccentColor),
        textAlign: TextAlign.center,
        cursorColor: kAccentColor,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kAccentColor),
          ),
        ));
  }
}
