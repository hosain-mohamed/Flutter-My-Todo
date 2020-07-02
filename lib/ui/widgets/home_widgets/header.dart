import 'package:clean_architecture/ui/widgets/home_widgets/menu_icon.dart';
import 'package:clean_architecture/ui/widgets/home_widgets/app_title.dart';
import 'package:clean_architecture/ui/widgets/home_widgets/tasks_numbers.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(
                top: deviceData.screenHeight * 0.03,
                right: deviceData.screenWidth * 0.03,
              ),
              child: Image.asset(
                "assets/images/header.png",
                fit: BoxFit.contain,
                height: deviceData.screenHeight * 0.25,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: deviceData.screenWidth * 0.1,
                top: deviceData.screenHeight * 0.06),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MenuIcon(),
                SizedBox(height: deviceData.screenHeight * 0.04),
                AppTitle(),
                TasksNumbers(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
