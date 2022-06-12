
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mandaCakes/database/db.dart';
import '../models/itens.dart';
import '../models/produtos.dart';
import 'produto_repositorie.dart';

class CarrinhoRepository extends ChangeNotifier {
  late Database db;
  List <Itens> _carrinho = [];
  double _total = 0;

  List <Itens> get carrinho => _carrinho;
  double get total => _total;
  CarrinhoRepository() {
    _initRepository();
    
  }

  _initRepository() async {
   await _getItens();   
  }

  _getTotal() async {
    db = await DB.instance.database;
    List  list = await db.query('carrinho');
    _total = carrinho.first.produto.valor * carrinho.first.quantidade;
    
    notifyListeners();
  }
  _getItens() async {
   db = await DB.instance.database;
    List list = await db.query('carrinho');
    //await _getTotal();
    notifyListeners();
   }

  

  void removeProduto(produto) {}

   addProduto(Itens first)  async{
    db = await DB.instance.database;
    db.update('carrinho',{
      'produto': first.produto.id,
      //'quantidade': first.quantidade
    },where: 'id = ?',whereArgs: [first.produto.id]);
    _getItens();
     notifyListeners();
    }

   
  } 
