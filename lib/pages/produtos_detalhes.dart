import 'package:flutter/material.dart';
import 'package:mandaCakes/repositories/carrinho_repositorie.dart';
import 'package:provider/provider.dart';

import '../models/produtos.dart';
import '../repositories/carrinho_repositorie.dart';

class ProdutoDetalhePage extends StatelessWidget {
  final Produto produto;
   ProdutoDetalhePage({Key? key, required this.produto}) : super(key: key);
  late CarrinhoRepository carrinho;


  @override
  Widget build(BuildContext context) {
    carrinho = Provider.of<CarrinhoRepository>(context, listen: false);
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
              height: 10,
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
                        subtitle: Text(r'R$ ' '${produto.valor}'),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Adicionar ao Carrinho'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        onPressed: () {
                          //carrinho.add(produto);
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: 20,
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
