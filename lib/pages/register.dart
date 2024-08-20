// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/pages/login.dart';
import 'package:flower_app/shared/colors.dart';
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 64,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: decorationTextfield.copyWith(
                          hintText: " Enter Your Username : "),
                    ),
                    SizedBox(
                      height: 33,
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
                    TextField(
                      controller: _confirmpasswordcontroller,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: decorationTextfield.copyWith(
                          hintText: " Confirm Your Passwword : "),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                                fontSize: 18,
                              ),
                            )),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
