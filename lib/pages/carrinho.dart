import 'package:flutter/material.dart';
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
  int quantidade = 0;
  late CarrinhoRepository carrinho;

@override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<CarrinhoRepository>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Manda Cakes'),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 10),
              child: Text('Sair'),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 0),
              child: IconButton(
                onPressed: () => context.read<Autenticacao>().logout(),
                icon: Icon(Icons.exit_to_app_sharp),
              ),
            ),
          ],
        ),
        body: Padding (padding:
        EdgeInsets.all(12) ,
        child: Column (children: [
          ListTile(
            title: Text ('Carrinho'),
            subtitle: Text ('carrinho.read()'),
          )
           
        ],
        ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/pedidos');
            },
            child: Text('Finalizar Pedido'),
          ),
        ),
        
        );
        
            
  }
}
