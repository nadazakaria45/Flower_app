// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_app/pages/checkout.dart';
import 'package:flower_app/pages/details_screen.dart';
import 'package:flower_app/pages/login.dart';
import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/shared/appbar.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) :super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            ProductsAndPrice()
          ],
          backgroundColor: appbarGreen,
          title: Text("Home"),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/222.jpg"),
                          fit: BoxFit.cover),
                    ),
                    currentAccountPicture: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage("assets/img/333.jpg")),
                    accountEmail: Text("nada@yahoo.com"),
                    accountName: Text("Nada Zakaria",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                  ),
                  ListTile(
                      title: Text("Home"),
                      leading: Icon(Icons.home),
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder:
                          (context) => Home()));
                      }),
                  ListTile(
                      title: Text("My products"),
                      leading: Icon(Icons.add_shopping_cart),
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder:
                          (context) => CheckOut()));
                      }),
                  ListTile(
                      title: Text("About"),
                      leading: Icon(Icons.help_center),
                      onTap: () {}),
                  ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: () {
                        FirebaseAuth.instance.signOut(); 
                        Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: 
                         (context) => Login()))  ;   
                      }),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Text("Developed by Nada Zakaria @2024",
                    style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 33),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => Details(product: items[index])));
                  },
                  child: GridTile(
                    child: Stack(children: [
                      Positioned(
                        top: -3,
                        bottom: -9,
                        right: 0,
                        left: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(items[index].imgPath)),
                      )
                    ]),
                    footer: GridTileBar(
          // backgroundColor: Color.fromARGB(66, 73, 127, 110),
                      trailing:  Consumer<Cart>(builder: ((context, Carttt, child) {
                        return IconButton(
                            color: Color.fromARGB(255, 62, 94, 70),
                            onPressed: () {
                              Carttt.add(items[index]);
                            },
                          icon: Icon(Icons.add));
                      })),
          
                      leading: Text("\$ 12.99"),
          
                      title: Text(
                        "",
                      ),
                    ),
                  ),
                );
              }),
        ),
        );
  }
}