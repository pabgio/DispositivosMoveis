import 'package:flutter/material.dart';
import 'package:mandaCakes/pages/perfil_page.dart';
import 'package:mandaCakes/pages/produtos_detalhes.dart';
import 'package:mandaCakes/repositories/produto_repositorie.dart';
import 'package:provider/provider.dart';
import '../models/produtos.dart';
import '../repositories/produto_repositorie.dart';
import '../services/autenticacao.dart';
import 'carrinho.dart';
import 'perfil_page.dart';

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
    produtolist = ProdutoRepository.tabela;
  }

  detalhes(Produto produto) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProdutoDetalhePage( produto:[produto] )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Manda Cakes'),
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
