
import 'package:manda_cakes/models/ItemModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BD {
  Database? db;

  Future openDB() async {
    try {
      // Get a location using getDatabasesPath
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'manda_cakes.db');

      // open the database
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print(db);
          this.db = db;
          createTables();
        },
      );
      return true;
    } catch (e) {
      print("ERRO AO ABRIR O BANCO DE DADOS $e");
      return Future.error(e);
    }
  }

  createTables() async {
    try {
      var qry = "CREATE TABLE IF NOT EXISTS shopping ( "
          "id INTEGER PRIMARY KEY,"
          "nome TEXT,"
          "image Text,"
          "preco REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";
      await db?.execute(qry);
      qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
          "id INTEGER PRIMARY KEY,"
          "shop_id INTEGER,"
          "nome TEXT,"
          "image Text,"
          "preco REAL,"
          "fav INTEGER,"
          "rating REAL,"
          "datetime DATETIME)";

      await db?.execute(qry);
    } catch (e) {
      print("Erro ao cria tabela");
      print(e);
    }
  }

  Future saveRecord(ShopItemModel data) async {
    await this.db?.transaction((txn) async {
      var qry =
          'INSERT INTO shopping(nome, preco, image,rating,fav) VALUES("${data.nome}",${data.preco}, "${data.image}",${data.rating},${data.fav ? 1 : 0})';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  Future setItemAsFavourite(int id, bool flag) async {
    var query = "UPDATE shopping set fav = ? WHERE id = ?";
    return await this.db?.rawUpdate(query, [flag ? 1 : 0, id]);
  }

  Future getItemsRecord() async {
    try {
      var list = await db?.rawQuery('SELECT * FROM shopping', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getCartList() async {
    try {
      var list = await db?.rawQuery('SELECT * FROM cart_list', []);
      return list ?? [];
    } catch (e) {
      return Future.error(e);
    }
  }

  Future addToCart(ShopItemModel data) async {
    await this.db?.transaction((txn) async {
      var qry =
          'INSERT INTO cart_list(shop_id, nome, preco, image,rating,fav) VALUES(${data.id}, "${data.nome}",${data.preco}, "${data.image}",${data.rating},${data.fav ? 1 : 0})';
      int id1 = await txn.rawInsert(qry);
      return id1;
    });
  }

  Future removeFromCart(int shopId) async {
    var qry = "DELETE FROM cart_list where shop_id = ${shopId}";
    return await this.db?.rawDelete(qry);
  }
}
