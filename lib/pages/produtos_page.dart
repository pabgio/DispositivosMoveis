import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/produtos_detalhes.dart';
import 'package:flutter_aula1/repositories/produto_repositorie.dart';

import '../models/produtos.dart';
import 'login.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({Key? key}) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  late ProdutoRepository produtosRepository;
  List<Produto> produtolist = [];

  @override
  void initState() {
    super.initState();
    produtosRepository = ProdutoRepository();
    produtolist = produtosRepository.produtos;
  }

  detalhes(Produto produto) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProdutoDetalhePage(produto: produto)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: const Text('Manda Cakes'),
        leading:  Image.asset('assets/Logo/cake.png'),
        actions: [
           Padding(
             padding: const  EdgeInsets.only( top: 20, left: 0, right: 0, bottom: 10),
             child: Text('Sair'),
           ),
          Padding(
            padding: const  EdgeInsets.only( top: 5, left: 0, right: 0, bottom: 0),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()
                                          )
                                          );
              }, 
              icon: Icon(Icons.exit_to_app_sharp),
              
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, int index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Hero(
                        tag: 'produto_${produtolist[index].id}',
                        child: Image.asset(
                            'assets/Produtos/${produtolist[index].id}.jpg'),
                            ),
                            ),
                title: Text(produtolist[index].descricao),
                subtitle: Text('${produtolist[index].valor} Reais'),
                onTap: () => detalhes(produtolist[index]),
              );
            },
            separatorBuilder: (_, __) => const Divider(thickness: 10),
            itemCount: produtolist.length),
      ),
    );
  }
}
