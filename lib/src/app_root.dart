import 'package:flutter/material.dart';
import 'package:flutter_task_one/login.dart';
import 'package:flutter_task_one/screens/log_in.dart';
import 'package:flutter_task_one/screens/start_screen.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily:'Poppins'),
      home: StartScreen(),
    );
  }
}
