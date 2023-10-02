import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:taxido/authentication/car_info.dart';
import 'package:taxido/authentication/login_screen.dart';
import 'package:taxido/authentication/sign_up.dart';
import 'package:taxido/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
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
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
        Center(
          child: Column(
            
            children: [
             
              Expanded( child: Opacity(opacity: 0.7, child: Image.asset("assets/taxi_6.jpg", fit: BoxFit.cover,))),
            ],
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: kGreen,
          ),
        

        ),
        Center(
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText("TAXIDO",textStyle: GoogleFonts.poppins(color: Colors.white,fontSize: 44,fontWeight: FontWeight.bold,),speed: Duration(milliseconds: 200))
        
            ],
             ),
        )
      ]),
    );
  }
}
