import 'package:mandaCakes/models/produtos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  get database async {
    if (_database != null) return _database;

    return await _init();
  }

  _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'mandaCakes.db'),
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_carrinho);
    await db.execute(_produto);
    await db.execute(_usuario);
  }

  String get _carrinho => '''
    CREATE TABLE carrinho (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_id INTEGER,
      value REAL
          )
  ''';

  String get _produto => '''
    CREATE TABLE produto (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      descricao TEXT,
      valor REAL
    )
  ''';

  String get _usuario => '''
    CREATE TABLE usuario (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      email TEXT,
      senha TEXT
    )
  ''';

  Future saveCompra(Produto data) async {
    await this.database?.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO produto (descricao, valor) VALUES ("${data.descricao}", ${data.valor})');
      int id1 = await txn.rawInsert('SELECT last_insert_rowid()');
      return id1;
    });
  }

  Future getItensSalvos() async {
    try {
      var list = await database.rawQuery('SELECT * FROM produto', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getCarrinho() async {
    try {
      var list = await database.rawQuery('SELECT * FROM carrinho', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future addNoCarrinho (Produto produto) async {
    await this.database?.transaction((txn) async {
      var add =
          'INSERT INTO carrinho (product_id, value) VALUES (${produto.id}, ${produto.valor})';
      int id1 = await txn.rawInsert(add);
      return id1;
    });

  }

  Future removeDoCarrinho (int compraId) async {
    await this.database?.transaction((txn) async {
      var remove ='DELETE FROM carrinho WHERE product_id = ${compraId}';
      return await this.database?.rawDelete(remove);
    });
  }

}
