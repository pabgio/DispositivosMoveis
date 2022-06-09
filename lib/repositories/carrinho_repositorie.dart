import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mandaCakes/database/db_firestore.dart';
import 'package:mandaCakes/repositories/produto_repositorie.dart';
import 'package:mandaCakes/services/autenticacao.dart';

import '../models/produtos.dart';
import 'package:flutter/material.dart';

class CarrinhoRepository extends ChangeNotifier {
  final List<Produto> _lista = [];
  late FirebaseFirestore db;
  late Autenticacao auth;

  CarrinhoRepository({required this.auth}) {
    _startRepository();
  }

  get total => null;

  get produtos => null;
  
  _startRepository() async {
    await _startFirestore();
    await readCarrinho();
  }

  _startFirestore() async {
    db = FireStroredb.get();
  }

 readCarrinho() async {
    if (auth.usuario != null && _lista.isEmpty) {
       final snapshot =
          await db.collection('usuarios/${auth.usuario!.uid}/carrinho').get();
      snapshot.docs.forEach((doc) {
        Produto produtos;
        produtos= ProdutoRepository.tabela.firstWhere((produto) => produto.id == doc.get('id'));
        _lista.add(produtos);
        notifyListeners();
      });
    }
  }

  save(List <Produto> produto) async {
     produto.forEach((produtos) async {
      if (produtos.quantidade > 0) {
        _lista.add(produtos);
        await db
            .collection('usuarios/${auth.usuario!.uid}/carrinho')
            .doc(produtos.descricao)
            .set({
          'produto': produtos.descricao,
          'quantidade': produtos.quantidade,
          'preco': produtos.valor,
        });
      }
      ;
    });
  }

  remove(produto) {
    _lista.removeWhere((p) => p.descricao == produto.descricao);
    db
        .collection('usuarios/${auth.usuario!.uid}/carrinho')
        .doc(produto.descricao)
        .delete();
  }

  clear() {
    _lista.clear();
    db.collection('usuarios/${auth.usuario!.uid}/carrinho').get().then((snapshot) {
      snapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  get lista => _lista;

   totalCarrinho() {
    double total = 0;
    _lista.forEach((produto) {
      total += produto.quantidade * produto.valor;
    });
    return total;
  }

  void removeProduto(produto) {}
  

 
}
