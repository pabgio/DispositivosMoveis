import 'package:flutter/cupertino.dart';
import 'package:mandaCakes/models/produtos.dart';
import 'package:mandaCakes/repositories/carrinho_repositorie.dart';
import 'package:mandaCakes/repositories/produto_repositorie.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db.dart';

class CarrinhoRepository extends ChangeNotifier {
   late Database db;
   List <Produtos> _carrinho = [];

   List<Produtos> get carrinho => _carrinho;

    CarrinhoRepository() {
      _initRepository();
    }

  get Produto => null;

    _initRepository() async {
      await getProdutos();
      


    }

    getProdutos() async {
     _carrinho = [];
      
    
      notifyListeners();
    }
}

class Produtos {
}