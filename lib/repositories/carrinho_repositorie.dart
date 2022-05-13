import "dart:collection";
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

  _startRepository() async {
    await _startFirestore();
    await reeadCarrinho();
  }

  _startFirestore() async {
    db = FireStroredb.get();
  }

  Future reeadCarrinho() async {
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

  save(List<Produto> produto) {
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

  void add(Produto produto) {
    _lista.add(produto);
    notifyListeners();
  }
}
