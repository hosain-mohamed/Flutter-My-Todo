import 'package:flutter/material.dart';
import 'UI/screens/tasks_screen.dart';
import 'package:clean_architecture/services/service_locator.dart';

void main() {
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var headerImage = Image.asset("assets/images/header.png");

  @override
  void didChangeDependencies() {
    precacheImage(headerImage.image, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
