import 'package:flutter/material.dart';
import 'package:flutter_task_one/Clipper/clipperClass.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_one/CheckBox.dart';
import 'package:flutter_task_one/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BuildTopClip(),
          Column(
            children: [
              MiddleText(),
              fullNameField(),
              const LogIn(),
            ],
          )
        ],
      ),
    );
  }

  Column MiddleText() {
    return Column(
      children: [
        const Text(
          "Welcome Back!",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Color(0xFF586D60),
          ),
        ),
        Text(
          "Log in to your account!",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFACACAC).withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  ClipPath BuildTopClip() {
    return ClipPath(
      clipper: BezierClipper(),
      child: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/icons/211686_back_arrow_icon.svg',
                  height: 40, width: 40, color: Colors.black),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF2B3783), width: 0.5),
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
              ], // border:
            ),
            height: 40,
            width: 50,
          ),
        ),
        height: 270,
        width: 600,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/plantsbackground.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Container fullNameField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 40)
      ]),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Full Name',
            hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.person),
            ),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}


