// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:flower_app/pages/forgot_password.dart';
import 'package:flower_app/pages/home.dart';
import 'package:flower_app/pages/register.dart';
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
    final _formKey = GlobalKey<FormState>();
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
        backgroundColor:Color.fromARGB(255, 76, 141, 95),
        body: 
            Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 33.0),

            child:
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image:DecorationImage
                          (
                            image:AssetImage("assets/img/15.webp"), 
                            fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),// لون الظل مع الشفافيه
                                spreadRadius: 8, //مدى انتشار الظل
                                blurRadius: 8,// مدى تلاشي الظل
                                offset: Offset(0, 4),// اتاحة الظل (x: 0 , y: 4)
                              ),
                            ], 
                        ),
                      ),
                                  SizedBox(
                    height: 64,
                                  ),
                                  TextFormField(
                                    validator: (email) {
                                      return email!.contains(RegExp(
                                           // للتحقق من الأنماط داخل النصوص
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                            ? null
                            : "Enter a valid email";                                    
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: decorationTextfield.copyWith(
                        hintText: " Enter Your Email : ",
                        prefixIcon: Icon(Icons.email, color: Colors.blue),),
                                  ),
                                  SizedBox(
                    height: 33,
                                  ),
                                  TextField(
                    controller: _passwordcontroller,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: decorationTextfield.copyWith(
                        hintText: " Enter Your Passwword : ",
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                       ),
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
                      style: TextStyle(fontSize: 19,color: Colors.blue),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                          elevation: MaterialStateProperty.all(15), //shadow of button
                    ),
                                  ),
                                  SizedBox(
                    height: 33,
                                  ),
                                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),
                      );
                    },
                    icon: Icon(Icons.lock_open,color: Colors.black,),
                    
                    label: Text("Forget password ?",
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                                  ),
                                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Don\'t have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 20),
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                                  )
                                ]),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
