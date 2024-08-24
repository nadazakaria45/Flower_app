import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: Colors.black,
    duration: const Duration(seconds: 10),
    content: Text(text,style: TextStyle(
      color: Colors.blue
    ),),
    action: SnackBarAction(label: "close", onPressed: () {}),
  ));
}
