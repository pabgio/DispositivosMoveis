import 'package:mandaCakes/controller/homeController.dart';
import 'package:mandaCakes/models/produtos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrinhoPage extends StatelessWidget {
  Widget gerarCarrinho(BuildContext context, Produto d) {
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
                      image: NetworkImage(d.imagem), fit: BoxFit.fitHeight)),
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
                            Get.find<HomeController>()
                                .removedoCarrinho(d.compraId ?? 0);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Produto removido do carrinho comm sucesso")));
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
                  Text("Valor ${d.valor.toString()}"),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }


  getItemTotal(List<Produto> items) {
    double sum = 0.0;
    items.forEach((e){sum += e.valor;});
    return "\$$sum";
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<HomeController>(
                builder: (_) {
                  if (controller.carrinho.length == 0) {
                    return Center(
                      child: Text("Carrinho vazio"),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: controller.carrinho
                        .map((d) => gerarCarrinho(context, d))
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
              Container(
                child: GetBuilder<HomeController>(
                  builder: (_) {
                    return RichText(
                      text: TextSpan(
                          text: "Total  ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: getItemTotal(controller.carrinho).toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)
                            )
                          ]
                      ),
                    );
                  },
                )
              ),
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
                    child: Text("Checkout", style: TextStyle(fontSize: 18),),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
