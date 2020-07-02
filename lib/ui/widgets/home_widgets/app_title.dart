import  'package:clean_architecture/ui/utils/constants.dart';
import  'package:flutter/material.dart';
import  'package:clean_architecture/ui/utils/device_config.dart';

class AppTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
    return Text(
      "My Todo",
      style: TextStyle(
        color: kPrimaryColor,
        fontSize: deviceData.screenHeight * 0.028,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}