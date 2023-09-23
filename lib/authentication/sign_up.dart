import 'package:flutter/material.dart';
import 'package:taxido/authentication/login_screen.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/lojo.png')),
            Text('Register as Driver'),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(label: Text('name')),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(label: Text('phone')),
            ),
            TextField(
              controller: mailController,
              decoration: InputDecoration(label: Text('mail')),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(label: Text('password')),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'create account',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 61, 100, 63),
              ),
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: () {
              Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        
              
            }, child: Text("Already have an account ? login here"))
          ],
        ),
      ),
    );
  }
}
