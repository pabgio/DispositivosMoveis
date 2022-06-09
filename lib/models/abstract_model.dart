import 'package:sqflite/sqflite.dart';
import "package:mandaCakes/application.dart";

abstract class AbstractModel {
  late Database _db;
  String get dbname;
  int get dbversion;

  Future<Database> init() async {
    if (this._db == null) {
      var databasePath = await getDatabasesPath();
      String path = databasePath + this.dbname;
      this._db = await openDatabase(path,
          version: this.dbversion,
          onCreate:(Database db, int version ) async {
              dbCreate.forEach((String sql)  async{
                await db.execute(sql);
               });
          });
    }
    return this._db;
  }
Future<Database> getDb() async {
    return await this.init();
  }
  Future <List<Map>> list();
  Future <Map> getItem(dynamic Where);
  Future <int> insert(Map<String, dynamic> values);
  Future <bool> update(Map<String, dynamic> values, dynamic Where);
  Future <bool> delete(dynamic id);

  void close() async {
    if (this._db != null) {
      await this._db.close();
    }
  }



}
