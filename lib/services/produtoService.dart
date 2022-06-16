import 'package:mandaCakes/models/produtos.dart';
import 'package:mandaCakes/database/db.dart';
import 'package:mandaCakes/services/lojaService.dart';

class ProdutosService {
  DB sqlService = DB.instance;
  LojaService lojaService = LojaService();
  List<Produto> produtosList = [];

  List<Produto> getProdutos() {
    int cont = 1;
    tabela.forEach((element) {
      element['id'] = cont;
      produtosList.add(Produto.fromJson(element));
      cont++;
    });
    return produtos;
  }

  List<Produto> get produtos => getProdutos();

  Future openDB() async {
    return await sqlService.database;
  }

  loadProdutos() async {
    bool primeiro = await primeiraVez();
    if (primeiro) {
      List produtos = await getLocalDB();
      return produtos;
    } else {
      List produtos = await saveLocalDB();
      return produtos;
    }
  }

  Future<bool> primeiraVez() async {
    return await lojaService.getProduto("primeiraVez") == true;
  }

  Future saveLocalDB() async {
    List<Produto> items = this.produtos;
    for (var i = 0; i < items.length; i++) {
      await sqlService.saveCompra(items[i]);
    }
    lojaService.setProduto("isFirstTime", "true");
    return await getLocalDB();
  }

  Future getLocalDB() async {
    return await sqlService.getItensSalvos();
  }

  Future addCarrinho(Produto produto) async {
    return await sqlService.saveCompra(produto);
    
  }

  Future getCarrinho() async {
    return await sqlService.getCarrinho();
  }

  Future removeCarrinho(int compraId) async {
    return await sqlService.removeDoCarrinho(compraId);
  }
}
