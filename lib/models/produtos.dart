import 'package:flutter/cupertino.dart';
 
var  tabela = [
    {
      "id": 1,
        "nome" : "Morango",
       " descricao": 'Bolo de Morango',
        "valor": 5,
        "quantidade": 0,
    },
    {
      "id": 2,
        "nome" : "Brigadeiro",
       " descricao": 'Bolo de Brigadeiro',
        "valor": 5,
        "quantidade": 0,
    },
    {
      "id": 3,
        "nome" : "Maracujá",
       " descricao": 'Bolo de Maracujá',
        "valor": 5,
        "quantidade": 0,
    },
    {
      "id": 4,
        "nome" : "Bis",
       " descricao": 'Bolo de Bis',
        "valor": 5,
        "quantidade": 0,
    },
    {
      "id": 5,
        "nome" : "Bannoffe",
       " descricao": 'Bolo de Bannoffe',
        "valor": 5,
        "quantidade": 0,
    },
     {
      "id": 6,
        "nome" : "Limão",
       " descricao": 'Bolo de Limão',
        "valor": 5,
        "quantidade": 0,
    },
      {
      "id": 7,
        "nome" : "Negresco",
       " descricao": 'Bolo de Negresco',
        "valor": 5,
        "quantidade": 0,
    },
  ];


class Produto{
  int id;
  String descricao;
  String nome;
  double valor;
  int quantidade;
  String imagem;
  int? compraId;

  Produto({
    this.compraId,
    required this.id,
    required this.descricao,
    required this.valor,
    required this.nome,
    required this.imagem,
    required this.quantidade
  }
  );

  factory Produto.fromJson(Map<String, dynamic> json){
    return Produto(
      id: json['id'],
      descricao: json['descricao'],
      valor: json['valor'],
      nome: json['nome'],
      imagem: json['imagem'],
      quantidade: json['quantidade'],
      compraId: json['compraId'] ?? 0,


    );
  }
}