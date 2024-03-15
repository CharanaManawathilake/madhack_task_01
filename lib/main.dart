import 'package:flutter/material.dart';
import 'package:madhack_task_01/pages/jobList.dart';
import 'pages/profile.dart';
import 'pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
          // Define your app's theme here
          ),
      home: jobList(),
    );
  }
}
