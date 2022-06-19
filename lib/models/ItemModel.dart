import 'package:flutter/cupertino.dart';

var data = [
  {
    "name": "Bolo de Morango",
    "price": 5.0,
    "fav": false,
    "rating": 4.5,
    "image":
        "https://receitatodahora.com.br/wp-content/uploads/2017/06/bolo-de-pote-de-leite-ninho-com-morango.jpg"
  },
  {
    "name": "Bolo de Chocolate",
    "price": 5.0,
    "fav": false,
    "rating": 4.5,
    "image":
        "https://amoradoceria.com.br/wp-content/uploads/2022/03/receita-de-bolo-no-pote-de-chocolate.jpg"
  },
  {
    "name": "Bolo de Limao",
    "price": 5.0,
    "fav": false,
    "rating": 4.5,
    "image":
        "https://bolosparavender.com.br/wp-content/uploads/2018/12/bolo-de-pote-de-lim%C3%A3o-1200x900.jpg"
  },
  {
    "name": "Bolo de Maracuja",
    "price": 5.0,
    "fav": false,
    "rating": 3.5,
    "image":
        "https://t1.rg.ltmcdn.com/pt/posts/8/9/0/bolo_de_pote_de_maracuja_3098_600.jpg"
  },

];

class ShopItemModel {
  String name;
  double price;
  bool fav;
  double rating;
  String image;
  int id;
  int? shopId;

  ShopItemModel(
      {this.shopId,
      required this.id,
      required this.fav,
      required this.rating,
      required this.price,
      required this.image,
      required this.name});

  factory ShopItemModel.fromJson(Map<String, dynamic> json) {
    return ShopItemModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      price: json['price'],
      image: json['image'],
      name: json['name'],
      shopId: json['shop_id'] ?? 0,
    );
  }
}
