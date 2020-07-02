import 'package:flutter/material.dart';
import 'package:clean_architecture/ui/utils/constants.dart';
import 'package:clean_architecture/ui/utils/device_config.dart';

class MenuIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData =DeviceData.init(context);
    return CircleAvatar(
      child: Icon(
        Icons.menu,
        color: kAccentColor ,
        size: deviceData.screenWidth * 0.085,
      ),
      backgroundColor: kPrimaryColor,
      radius: deviceData.screenWidth * 0.075,
    );
  }
}
