import 'package:flutter/material.dart';
import 'package:taxido/Globals/globals.dart';
import 'package:taxido/splashscreen/splash_screen.dart';

class ProfiletabScreen extends StatefulWidget {
  const ProfiletabScreen({super.key});

  @override
  State<ProfiletabScreen> createState() => _ProfiletabScreenState();
}

class _ProfiletabScreenState extends State<ProfiletabScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await firebaseAuth.signOut();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MySplashScreen()));
          },
          child: Text("log out")),
    );
  }
}
