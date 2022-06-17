


import 'package:flutter/cupertino.dart';

var tabela = [
  {
    "nome": "Morango",
    "valor": 5.0,
    "fav": false,
    "rating": 4.5,
    "imagem":
        "../assets/Produtos/1.jpg",
  },
  {
    "nome": "Brigadeiro ",
    "valor": 5.0,
    "fav": false,
    "rating": 4.5,
    "imagem":
        "https://cdn-imagem.travelandleisure.com/sites/default/files/styles/1600x1000/public/merrell_0.jpg?itok=wFRPiIPw"
  },
  {
    "nome": "Maracujá",
    "valor": 5.0,
    "fav": false,
    "rating": 4.5,
    "imagem":
        "https://n4.sdlcdn.com/imgs/d/h/i/Asian-Gray-Running-Shoes-SDL691594953-1-2127d.jpg"
  },
  {
    "nome": "Chocolate",
    "valor": 5.0,
    "fav": false,
    "rating": 3.5,
    "imagem":
        "https://cdn.pixabay.com/photo/2014/06/18/18/42/running-shoe-371625_960_720.jpg"
  },
  
];

class ProdutoModel {
  String nome;
  double valor;
  bool fav;
  double rating;
  String imagem;
  int id;
  int? compraId;

  ProdutoModel(
      {this.compraId,
      required this.id,
      required this.fav,
      required this.rating,
      required this.valor,
      required this.imagem,
      required this.nome});

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      id: json['id'],
      fav: json['fav'] == 1,
      rating: json['rating'],
      valor: json['valor'],
      imagem: json['imagem'],
      nome: json['nome'],
      compraId: json['compraId'] ?? 0,
    );
  }
}
