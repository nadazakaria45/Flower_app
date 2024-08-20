import 'package:flower_app/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
  List selectedProducts = [];
  int price = 0;

  add(Item product) { //product =items[index]
    selectedProducts.add(product);
    price += product.price.round(); // rounnd تقريب السعر لأقرب رقم صحيح
    notifyListeners(); //  setstate زي ال ,  refresh  بتعمل 
  }
   delete(Item product) {
    selectedProducts.remove(product);
    price -= product.price.round();

    notifyListeners();
  }
  get itemcount {
    return selectedProducts.length;
  }

}