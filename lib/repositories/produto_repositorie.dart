import 'package:mandaCakes/models/produtos.dart';

class ProdutoRepository {
  List<Produto> produtos = [];

  ProdutoRepository() {
    produtos = [
      Produto(
        id: 1,
        nome: 'Morango',
        descricao: 'Bolo de Morango',
        valor: 5,
        quantidade: 0,
      ),
      Produto(
        id: 2,
         nome: 'Brigadeiro',
        descricao: 'Bolo de Brigadeiro',
        valor: 5,
        quantidade: 0,
      ),
      Produto(
        id: 3,
        nome: 'Maracujá',
        descricao: 'Bolo de Maracujá',
        valor: 5,
        quantidade: 0,
      ),
      Produto(
        id: 4,
        nome: 'BIS',
        descricao: 'Bolo de Bis',
        valor: 5,
        quantidade: 0,
      ),
      Produto(
        id: 5,
        nome: 'Bannoffe',
        descricao: 'Bolo de Bannoffe',
        valor: 5,
        quantidade: 0,
      ),
      Produto(
        id: 6,
        nome: 'Limão',
        descricao: 'Bolo de Limão',
        valor: 5,
        quantidade: 0,
      ),
      Produto(
        id: 7,
        nome: 'Negresco',
        descricao: 'Bolo de Negresco',
        valor: 5,
        quantidade: 0,
      ),
    ];
  }
}
