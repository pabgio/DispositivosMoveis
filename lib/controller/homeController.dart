import 'package:mandaCakes/models/produtos.dart';
import 'package:mandaCakes/services/produtoService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ProdutosService produtosService = ProdutosService();
  List<Produto> produtos = [];
  List<Produto> carrinho = [];
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    loadDB();
  }

  loadDB() async {
    await produtosService.openDB();
    loadProdutos();
    getCarrinhoLista();
  }

  getProduto(int id) {
    return produtos.singleWhere((element) => element.id == id);
  }

  bool carrinhoPronto(id) {
    return carrinho.indexWhere((element) => element.compraId == id) > -1;
  }

  getCarrinhoLista() async {
    try {
      List lista = await produtosService.getCarrinho();
      carrinho.clear();
      lista.forEach((element) {
        carrinho.add(Produto.fromJson(element));
      });
      update();
    } catch (e) {
      print(e);
    }
  }
  loadProdutos() async {
    try {
      loading = true;
      update();

      List lista = await produtosService.loadProdutos();
      lista.forEach((element) {
        produtos.add(Produto.fromJson(element));
      });
      loading = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future addNoCarrinho(Produto item) async {
    loading = true;
    update();
    var result = await produtosService.addCarrinho(item);
    loading = false;
    update();
    return result;
  }

  removedoCarrinho(int compraId) async {
    produtosService.removeCarrinho(compraId);
    int index = carrinho.indexWhere((element) => element.compraId == compraId);
    carrinho.removeAt(index);
    update();
  }
      

}
