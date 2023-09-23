import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxido/authentication/car_info.dart';
import 'package:taxido/authentication/sign_up.dart';
import 'package:taxido/constants/texstyles.dart';
import 'package:taxido/mainscreen/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 2), () async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Signup_Screen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.green.shade800,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/lojo.png"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Taxido",
                style: mediumTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
