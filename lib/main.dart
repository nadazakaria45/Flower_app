// ignore_for_file: unused_import

import 'package:flower_app/pages/forgot_password.dart';
import 'package:flower_app/pages/home.dart';
import 'package:flower_app/pages/login.dart';
import 'package:flower_app/pages/register.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flower_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'pages/details_screen.dart';
import'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) {return Cart();},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ForgotPassword(),
      ),
    );
  }
}
