import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxido/Globals/functions.dart';
import 'package:taxido/Globals/globals.dart';
import 'package:taxido/authentication/sign_up.dart';
import 'package:taxido/constants/colors.dart';
import 'package:taxido/splashscreen/splash_screen.dart';
import 'package:taxido/widgets/widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLLoading = false;
  validateForm() {
    if (!mailController.text.contains("@")) {
      customErrorMessage(context, message: "Enter a valid email");
    } else if (passwordController.text.isEmpty) {
      customErrorMessage(context, message: "enter correct password");
      // Fluttertoast.showToast(msg: "Password is required.");
    } else {
      loginDriverNow();
    }
  }

  loginDriverNow() async {
    try {
      setState(() {
        isLLoading = true;
      });
      final UserCredential firebaseUser =
          await firebaseAuth.signInWithEmailAndPassword(
        email: mailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (firebaseUser.user != null) {
        currentFirebaseUser = firebaseUser.user;
        setState(() {
          isLLoading = false;
        });

        
        // Fluttertoast.showToast(msg: "Login Successful.");
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MySplashScreen()));
      }
    } catch (msg) {
      setState(() {
        isLLoading = false;
      });
      customErrorMessage(context, message: msg.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kGreen,
        body: SafeArea(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upper Container with Rounded Top Corners
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: kGreen,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome back",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  // Add additional content in the lower container if needed
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(46, 204, 113, 0.3),
                                    offset: Offset(0, 10),
                                    blurRadius: 20)
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextField(
                                    controller: mailController,
                                    decoration: InputDecoration(
                                        hintText: "email or phone",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        hintText: "password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Forget Password",
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ElevatedButton(
                              onPressed: () {
                                validateForm();
                                // Add your log
                                //vain logic here
                              },
                              style: ElevatedButton.styleFrom(
                                primary: kGreen, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0), // Rounded corners
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Signup_Screen())),
                            child: Text(
                              "Don't have a account? sign up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Lower Container in Green
              ],
            ),
            isLLoading ? LoadingWidget() : Container()
          ]),
        ),
      ),
    );
  }
}
