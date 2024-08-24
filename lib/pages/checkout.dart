
// ignore_for_file: prefer_const_constructors

import 'package:flower_app/provider/cart.dart';
import 'package:flower_app/shared/appbar.dart';
import 'package:flower_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: ((context, Carttt,child) {
      return
    Scaffold(
      backgroundColor: appbarGreen,
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("checkout screen",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        actions: [ProductsAndPrice()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: Carttt.selectedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(                     
                      child: ListTile(
                        title: Text(Carttt.selectedProducts[index].name,style: TextStyle(fontWeight: FontWeight.bold,),),
                        subtitle: Text(
                            "${Carttt.selectedProducts[index].price} - ${Carttt.selectedProducts[index].location}"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              Carttt.selectedProducts[index].imgPath),
                        ),
                        trailing: IconButton(
                            onPressed: (){
                              Carttt.delete(Carttt.selectedProducts[index]);
                            },
                            icon: Icon(Icons.remove)),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Pay \$${Carttt.price}",
              style: TextStyle(fontSize: 19,color: Colors.white,),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
                  elevation: MaterialStateProperty.all(20),
            ),
          ),
        ],
      ),
    );
    }));
  }
}
