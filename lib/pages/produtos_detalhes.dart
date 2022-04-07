import 'package:flutter/material.dart';

import '../models/produtos.dart';

class ProdutoDetalhePage extends StatelessWidget {
  final Produto produto;
  const ProdutoDetalhePage({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bolo de ${produto.nome}'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      
                    ),
                    child: ClipRRect(
                      child: Hero(
                          tag: 'produto_${produto.id}',
                          child:
                              Image.asset('assets/Produtos/${produto.id}.jpg')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 10,
                    child: Column(children: [
                      ListTile(
                        leading: const Icon(Icons.cake_rounded),
                        title: Text(produto.descricao),
                        subtitle: Text(r'R$' '${produto.valor}' ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
