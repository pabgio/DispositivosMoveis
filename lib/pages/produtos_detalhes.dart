import 'package:flutter/material.dart';

import '../models/produtos.dart';

class ProdutoDetalhePage extends StatelessWidget {
  final Produto produto;
  const ProdutoDetalhePage({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 175, 180, 180).withOpacity(0.5),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bolo ${produto.nome}'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
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
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5)
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                          tag: 'produto_${produto.id}',
                          child:
                              Image.asset('assets/Produtos/${produto.id}.jpg')),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Column(children: [
                      ListTile(
                        leading: const Icon(Icons.add_business),
                        title: Text(produto.descricao),
                        subtitle: Text('${produto.valor}' r'R$'),
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
