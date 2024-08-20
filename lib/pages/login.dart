// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flower_app/pages/forgot_password.dart';
import 'package:flower_app/pages/home.dart';
import 'package:flower_app/pages/register.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:   Center(
            child: Padding(
              padding: const EdgeInsets.all(33.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  height: 64,
                ),
                TextField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextfield.copyWith(
                      hintText: " Enter Your Email : "),
                ),
                SizedBox(
                  height: 33,
                ),
                TextField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: decorationTextfield.copyWith(
                      hintText: " Enter Your Passwword : "),
                ),
                SizedBox(
                  height: 33,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await signIn();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } catch (e) {
                      // هنا يمكنك إظهار رسالة خطأ للمستخدم
                      print(e.toString());
                    }
                  },
                  child: Text(
                    " Log in ",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(BTNgreen),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Text("Forget password ?",
                      style: TextStyle(
                          fontSize: 18, color: Colors.blue)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " Don\'t have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                  ],
                )
              ]),
            ),
          ),
        ),
    );
  }
}
