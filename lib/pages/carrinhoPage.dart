import 'package:manda_cakes/controller/homePageController.dart';
import 'package:manda_cakes/models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrinhoPage extends StatelessWidget {
  Widget generateCart(BuildContext context, ShopItemModel d) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade100, width: 1.0),
              top: BorderSide(color: Colors.grey.shade100, width: 1.0),
            )),
        height: 100.0,
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(d.image), fit: BoxFit.fitHeight)),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          d.nome,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.0),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: InkResponse(
                          onTap: () {
                            Get.find<HomePageController>()
                                .removeFromCart(d.shopId ?? 0);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Item removido")));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Preco ${d.preco.toString()}"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  getItemTotal(List<ShopItemModel> items) {
    double sum = 0.0;
    items.forEach((e) {
      sum += e.preco;
    });
    return "R\$$sum";
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomePageController>();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<HomePageController>(
                builder: (_) {
                  if (controller.cartItems.length == 0) {
                    return Center(
                      child: Text("Carrinho Vazio",
                          style: TextStyle(fontSize: 20.0)),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: controller.cartItems
                        .map((d) => generateCart(context, d))
                        .toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: GetBuilder<HomePageController>(
                builder: (_) {
                  return RichText(
                    text: TextSpan(
                        text: "Total  ",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  getItemTotal(controller.cartItems).toString(),
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  );
                },
              )),
              Container(
                alignment: Alignment.centerLeft,
                height: 50,
                color: Colors.white,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    child: Text(
                      "Comprar",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
