class Item { // class  to use as datatype in the list.
  String imgPath;
  double price; //variables in each photo.
  String location;
  String name;

  Item({required this.imgPath, required this.name,required this.price, this.location = " Main Branch "});
}


  final List<Item> items = [
    Item(price: 122.99 , name : "product 1" , imgPath: "assets/img/1.webp" ),
    Item(price: 512.99 , name : "product 2"  , imgPath: "assets/img/2.webp" , location: "Another Shop "),
    Item(price: 132.99 , name : "product 3" , imgPath: "assets/img/3.webp"),
    Item(price: 612.99 , name : "product 4" , imgPath: "assets/img/4.webp"),
    Item(price: 412.99 , name : "product 5" , imgPath: "assets/img/5.webp"),
    Item(price: 124.99 , name : "product 6" , imgPath: "assets/img/6.webp"),
    Item(price: 312.99 , name : "product 7" , imgPath: "assets/img/7.webp"),
    Item(price: 212.99 , name : "product 8" , imgPath: "assets/img/8.webp"),
  ];