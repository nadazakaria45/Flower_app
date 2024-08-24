// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/pages/login.dart';
import 'package:flutter/material.dart';

import '../shared/constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future signUp() async {
    if (isConfirmed())
    {await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
  }}
  bool isConfirmed(){
    if(_passwordcontroller.text.trim() == _confirmpasswordcontroller.text.trim()){
      return true;
    }
    else{
      return false;
    }

  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Get your free account",style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                        ),
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: decorationTextfield.copyWith(
                            hintText: " Enter Your Username : ",
                            prefixIcon: Icon(Icons.person , color: Colors.blue),
                            ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      /*TextField(
                        controller: _emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: decorationTextfield.copyWith(
                      hintText: " Enter Your Email : ",
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      ),
                      ),*/
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
                      TextField(
                        controller: _confirmpasswordcontroller,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: decorationTextfield.copyWith(
                            hintText: " Confirm Your Passwword : ",
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      ElevatedButton(
                        onPressed: () async{
                          try{
                          await signUp();
                          Navigator.pushReplacement(context,
                           MaterialPageRoute(builder:
                            (context) => Login()),);
                          }
                          catch (e) {
                      // هنا يمكنك إظهار رسالة خطأ للمستخدم
                      print(e.toString());
                    }
                        },
                        child: Text(
                          " Sign up ",
                          style: TextStyle(fontSize: 19,
                          color: Colors.blue),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                              elevation: MaterialStateProperty.all(15),
                        ),
                      ),
                      SizedBox(
                        height: 33,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Already have an account?",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                );
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
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
