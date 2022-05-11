import 'package:flutter/material.dart';
import 'package:mandaCakes/models/itens.dart';
import 'package:mandaCakes/repositories/carrinho_repositorie.dart';
import 'package:provider/provider.dart';

import '../models/produtos.dart';
import '../services/autenticacao.dart';

class CarrinhoPage extends StatefulWidget {
  CarrinhoPage({Key? key}) : super(key: key);

  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  int quantidade=0;
  late CarrinhoRepository carrinho;
  @override
  Widget build(BuildContext context) {
    carrinho =context.watch<CarrinhoRepository>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Manda Cakes'),
        actions: [
          Padding(
            padding: const  EdgeInsets.only( top: 20, left: 0, right: 0, bottom: 10),
            child: Text('Sair'),
          ),
          Padding(
            padding: const  EdgeInsets.only( top: 5, left: 0, right: 0, bottom: 0),
            child: IconButton(
              onPressed: ()=> context.read<Autenticacao>().logout(),
              icon: Icon(Icons.exit_to_app_sharp),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Carrinho',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '${carrinho.itens.length} itens',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

          ],


            )
          
        )
    );  

  }
  
  }