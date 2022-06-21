import 'package:manda_cakes/controller/homePageController.dart';
import 'package:manda_cakes/models/ItemModel.dart';
import 'package:manda_cakes/pages/carrinhoPage.dart';
import 'package:manda_cakes/pages/ItemDetail.dart';
import 'package:manda_cakes/pages/perfil_page.dart';
import 'package:manda_cakes/services/itemService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemServices itemServices = ItemServices();
  List<ShopItemModel> items = [];
  final HomePageController controller = Get.put(HomePageController());

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
          title: Text("Manda Cakes"),
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
                      GetBuilder<HomePageController>(builder: (_) => Align(
                        child: Text(controller.cartItems.length > 0 ? controller.cartItems.length.toString() : ''),
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
                    MaterialPageRoute(builder: (_) => HomePage()),
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
          child: GetBuilder<HomePageController>(
            init: controller,
            builder: (_) => controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ShopItemListing(
                    items: controller.items,
                  ),
          ),
        ));
  }
}

class ShopItemListing extends StatelessWidget {
  final List<ShopItemModel> items;

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
  final ShopItemModel item;

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
                    builder: (context) => ItemDetailPage(itemId: item.id)));
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
                                  item.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Container(
                              child: item.fav
                                  ? Icon(
                                      Icons.favorite,
                                      size: 20.0,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 20.0,
                                    ),
                            )
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
                              "\$${item.preco.toString()}",
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
