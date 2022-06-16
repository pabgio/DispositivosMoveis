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
import 'package:mandaCakes/controller/homeController.dart';
import 'package:mandaCakes/models/produtos.dart';
import 'package:mandaCakes/pages/carrinho.dart';
import 'package:mandaCakes/services/produtoService.dart';
import 'package:get/get.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  ProdutosService itemServices = ProdutosService();
  List<Produto> items = [];
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("MandaCakes"),
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: InkResponse(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CarrinhoPage()));
                  },
                  child: Stack(
                    children: [
                      GetBuilder<HomeController>(builder: (_) => Align(
                        child: Text(controller.carrinho.length > 0 ? controller.carrinho.length.toString() : ''),
                        alignment: Alignment.topLeft,
                      )),
                      Align(
                        child: Icon(Icons.shopping_cart),
                        alignment: Alignment.center,
                      ),
                    ],
                  )),
            )
          ],
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
        body: Container(
          child: GetBuilder<HomeController>(
            init: controller,
            builder: (_) => controller.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ShopItemListing(
                    items: controller.produtos,
                  ),
          ),
        )
        );
  }
}

class ShopItemListing extends StatelessWidget {
  final List<Produto> items;

  ShopItemListing({required this.items});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int index) {
          return ItemView(
            item: items[index],
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class ItemView extends StatelessWidget {
  final Produto item;

  ItemView({required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkResponse(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProdutoDetalhePage(produtoId: item.id)));
          },
          child: Material(
            child: Container(
                height: 380.0,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8.0)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Image.network(
                                  item.imagem,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "${item.nome}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              "\$${item.valor.toString()}",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}

