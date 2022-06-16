import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mandaCakes/controller/homeController.dart';
import '../models/produtos.dart';
import 'package:get/get.dart';
import 'package:mandaCakes/widgets/CustomButton.dart';
import 'package:mandaCakes/widgets/DotWidget.dart';

class ProdutoDetalhePage extends StatefulWidget {
  final int produtoId;

  ProdutoDetalhePage({required this.produtoId});

  @override
  _ProdutoDetalhePageState createState() => _ProdutoDetalhePageState();
}

class _ProdutoDetalhePageState extends State<ProdutoDetalhePage> {
  late PageController pageController;
  int active = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  Widget buildDot(int index, int num) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: (num == index) ? Colors.black38 : Colors.grey[200],
              shape: BoxShape.circle),
        ));
  }

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    Produto model = controller.getProduto(widget.produtoId);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: ListView(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: <Widget> [
                    Container(
                      height: 200,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            active = index;
                          });
                        },
                        children: <Widget>[
                          Image.asset(
                            model.imagem,
                            height: 150,
                          ),
                          Image.asset(
                            model.imagem,
                            height: 150,
                          ),
                          Image.asset(
                            model.imagem,
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DotWidget(activeIndex: active, dotIndex: 0),
                        DotWidget(activeIndex: active, dotIndex: 1),
                        DotWidget(activeIndex: active, dotIndex: 2),
                        DotWidget(activeIndex: active, dotIndex: 3),
                      ],
                    ),
                  ],
                ),
              ),
            ]
            ),

            Divider(
              color: Colors.grey[300],
              height: 1.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.nome,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 19.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 18.0),
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: Text(
                        "Total Amount",
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    ),
                    Text("\$${model.valor.toString()}",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              GetBuilder<HomeController>(builder: (_) {
                bool isAdded = controller.carrinhoPronto(model.id);
                if (isAdded) {
                  return CustomButton(
                    name: "REMOVE CART",
                    onTap: () async {
                      try {
                        controller.removedoCarrinho(model.id);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Item removed from cart successfully")));
                      } catch (e) {
                        print(e);
                      }
                    },
                  );
                }
                return CustomButton(
                  name: "ADD TO CART",
                  onTap: controller.loading ? null : ()  async {
                    try {
                      var result = await controller.addNoCarrinho(model);
                      controller.getCarrinhoLista();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Item added in cart successfully")));
                    } catch (e) {
                      print(e);
                    }
                  },
                );
              })
            ],
          )),
    );
  }
}
