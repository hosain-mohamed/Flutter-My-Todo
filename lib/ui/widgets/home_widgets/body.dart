import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';
import 'package:clean_architecture/ui/widgets/home_widgets/tasks_list_view.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);

    return Padding(
    padding:  EdgeInsets.only(top:deviceData.screenHeight*0.3),
      child: Container( 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(deviceData.screenWidth * 0.1),
            topRight: Radius.circular(deviceData.screenWidth * 0.1),
          ),
        ),
        child: ListViewBuilder(),
      ),
    );
  }
}
