import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/produtos_detalhes.dart';
import 'package:flutter_aula1/repositories/produto_repositorie.dart';

import '../models/produtos.dart';

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
    produtosRepository= ProdutoRepository();
    produtolist= produtosRepository.produtos;


  }

detalhes( Produto produto){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => ProdutoDetalhePage(produto: produto)),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Manda Cakes'
        ),
        
      ),
    body:Padding(
      padding:const EdgeInsets.all(10),
      child: ListView.separated(
        itemBuilder: (context, int index){
        return ListTile(
          leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Hero(
            tag: 'produto_${produtolist[index].id}',
            child: Image.asset('assets/Produtos/${produtolist[index].id}.jpg'))),
          title:  Text(produtolist[index].descricao),
          subtitle: Text('${produtolist[index].valor} Reais'),
          onTap: ()=> detalhes(produtolist[index]),
    
        );
      },
       separatorBuilder: (_,__)=> const Divider(),
        itemCount: produtolist.length),
    ) ,

    );
  }
}