import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandaCakes/database/db_firestore.dart';
import 'package:mandaCakes/repositories/produto_repositorie.dart';
import 'package:mandaCakes/services/autenticacao.dart';

import '../models/produtos.dart';
import 'package:flutter/material.dart';

class CarrinhoRepository extends ChangeNotifier {
  final List<Produto> lista = [];
  late FirebaseFirestore db;
  late Autenticacao auth;

  CarrinhoRepository({required this.auth}) {
    _startRepository();
  }

  get total => null;

  get produto => null;
  
  _startRepository() async {
    await _startFirestore();
    await readCarrinho();
  }

  _startFirestore() async {
    db = FireStroredb.get();
  }

 readCarrinho() async {
    if (auth.usuario != null && lista.isEmpty) {
       final snapshot =
          await db.collection('usuarios/${auth.usuario!.uid}/carrinho').get();
      snapshot.docs.forEach((doc) {
        Produto produto;
        produto= ProdutoRepository.tabela.firstWhere((produto) => produto.id == doc.get('id'));
        lista.add(produto);
        notifyListeners();
      });
    }
  }

  save(List <Produto> produto) async {
     produto.forEach((produto) async {
      if (produto.quantidade > 0) {
        lista.add(produto);
        await db
            .collection('usuarios/${auth.usuario!.uid}/carrinho')
            .doc(produto.descricao)
            .set({
          'produto': produto.descricao,
          'quantidade': produto.quantidade,
          'preco': produto.valor,
        });
        notifyListeners();
      }
      ;
    });
  }

  remove(produto) {
    lista.removeWhere((p) => p.descricao == produto.descricao);
    db
        .collection('usuarios/${auth.usuario!.uid}/carrinho')
        .doc(produto.descricao)
        .delete();
  }

  clear() {
    lista.clear();
    db.collection('usuarios/${auth.usuario!.uid}/carrinho').get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }


   totalCarrinho() {
    double total = 0;
    lista.forEach((produto) {
      total += produto.quantidade * produto.valor;
    });
    return total;
  }

  void removeProduto(produto) {}

  
  

 
}
