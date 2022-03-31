import 'package:flutter/material.dart';

import '../models/produtos.dart';


class ProdutoDetalhePage extends StatelessWidget {
  final Produto produto;
  const ProdutoDetalhePage({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 181, 230, 236),
        appBar: AppBar(
        title: Text('Bolo ${produto.nome}'), 
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: 
       SingleChildScrollView(
         child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Hero(
            tag: 'produto_${produto.id}',
            child: Image.asset('assets/Produtos/${produto.id}.jpg')
            ),
           
              Card(
                child: Column (
                  
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_business),
                      title: Text(produto.descricao),
                      subtitle: Text( '${produto.valor}'r'R$'),
                      
                    ),
                    
                    const Divider( thickness: 1,),
                  
                  ]),
                  
              ),
              
              
            ],
          ),
             ),
       ),
    );
  }
}