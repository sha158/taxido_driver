import 'package:flutter/material.dart';
import 'package:taxido/authentication/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Text('login as Driver'),
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
                'login',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 61, 100, 63),
              ),
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: () {
              Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Signup_Screen()));

              
            }, child: Text("Dont have an account ? register here"))
          ],
        ),
      ),
    );
  }
}
