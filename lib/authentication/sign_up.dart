import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxido/Globals/globals.dart';
import 'package:taxido/authentication/car_info.dart';
import 'package:taxido/authentication/login_screen.dart';
import 'package:taxido/constants/colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  bool isLoading = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  signUpForm(context) {
    if (namecontroller.text.isEmpty) {
      showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter your name",
        ),
      );
    } else if (!mailController.text.contains("@")) {
      showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter a valid email",
        ),
      );
    } else if (phoneController.text.length < 9) {
      showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Please enter proper contact number",
        ),
      );
    } else if (passwordController.text.length < 6) {
      showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
        const CustomSnackBar.error(
          message: "Password is lesser than 6 characters",
        ),
      );
    } else {
      saveDriverInfo();
    }
  }

  showLoader() {
    setState(() {
      isLoading = true;
    });
  }

  saveDriverInfo() async {
    showLoader();
    await Future.delayed(Duration(seconds: 3));
    final UserCredential fuser = await firebaseAuth
        .createUserWithEmailAndPassword(
            email: mailController.text.trim(),
            password: passwordController.text.trim())
        .catchError((err) {
      setState(() {
        isLoading = false;
        showTopSnackBar(
          snackBarPosition: SnackBarPosition.bottom,
          Overlay.of(context),
          const CustomSnackBar.error(
            message: "Error,Account has not been created",
          ),
        );
      });
    });
    if (fuser != null) {
      Map driverMap = {
        "id": fuser.user!.uid,
        "name": namecontroller.text.trim(),
        "email": mailController.text.trim(),
        "password": passwordController.text.trim()
      };

      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref().child("drivers");
      databaseReference.child(fuser.user!.uid).set(driverMap);

      currentFirebaseUser = fuser.user;
      showTopSnackBar(
        snackBarPosition: SnackBarPosition.bottom,
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Account has been created",
        ),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => CarInfo()));


      
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kGreen,
        body: Stack(alignment: Alignment.center, children: [
          SafeArea(
            child: Column(
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
                          "SignUp",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome to Taxido App",
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
                      child: Form(
                        key: _formKey,
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
                                      controller: namecontroller,
                                      decoration: InputDecoration(
                                          hintText: "name",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      controller: mailController,
                                      decoration: InputDecoration(
                                          hintText: "email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                          hintText: "phone",
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
                            // SizedBox(
                            //   height: 40,
                            // ),
                            // Text(
                            //   "Forget Password",
                            //   style: GoogleFonts.poppins(color: Colors.grey),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: ElevatedButton(
                                onPressed: () {
                                  signUpForm(context);
                                  // if (_formKey.currentState!.validate()) {
                                  //   signUpForm(context);
                                  // }
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => CarInfo()));
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kGreen, // Background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Rounded corners
                                  ),
                                ),
                                child: Text(
                                  'Enter car details',
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
                                      builder: (context) => LoginScreen())),
                              child: Text(
                                "Already have an account? sign in",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Lower Container in Green
              ],
            ),
          ),
          isLoading
              ? Center(
                  child: Positioned.fill(
                      child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white, size: 70)),
                )))
              : Container(),
        ]));
  }
}
