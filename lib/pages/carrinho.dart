import 'package:flutter/material.dart';
import 'package:mandaCakes/pages/perfil_page.dart';
import 'package:mandaCakes/pages/produtos_page.dart';
import 'package:provider/provider.dart';

import '../repositories/carrinho_repositorie.dart';
class CarrinhoPage extends StatefulWidget {
  CarrinhoPage({Key? key}) : super(key: key);

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  Widget build(BuildContext context) {
    final carrinho = context.watch<CarrinhoRepository>();

    return Scaffold(
      
      
      body: Padding (
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(  padding: const EdgeInsets.only(top: 40),
            child: Text(
              'Carrinho',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            ), ),
        Expanded(
              child: ListView.builder(
                itemCount: carrinho.carrinho.length,
                itemBuilder: (context, index) {
                  final item = carrinho.carrinho[index];
                  return ListTile(
                    leading: Icon(Icons.cake_rounded),
                    title: Text(carrinho.carrinho[index].produto.descricao),
                    subtitle: Text(r'R$ ' '${item.produto.valor}'),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              r'R$ ' '${carrinho.total}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Finalizar Pedido'),
              onPressed: () {
                Navigator.of(context).pushNamed('/finalizar');
                
              },
                style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
            ),
          ],
          
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                label: Text('Home'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ProdutosPage()),
                  );
                },
                icon: Icon(Icons.home_max_outlined),
              ),
              TextButton.icon(
                label: Text('Carrinho'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CarrinhoPage()),
                  );
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              TextButton.icon(
                label: Text('Perfil'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PerfilPage()),
                  );
                },
                icon: Icon(Icons.person_outline_rounded),
              ),
            ],
          ),
        ),
      ),
      );          

       
  }
}