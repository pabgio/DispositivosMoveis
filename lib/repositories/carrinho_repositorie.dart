import 'package:flutter/cupertino.dart';
import 'package:mandaCakes/models/produtos.dart';
import 'package:mandaCakes/repositories/produto_repositorie.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db.dart';
import '../models/itens.dart';

class CarrinhoRepository extends ChangeNotifier {
   late Database db;
   List <Itens> _carrinho = [];

   List<Itens> get carrinho => _carrinho;

    CarrinhoRepository() {
      _initRepository();
    }

  get itens => null;

    _initRepository() async {
      await  getItens();

    }

    getItens() async {
     _carrinho = [];
    
      notifyListeners();
    }
}