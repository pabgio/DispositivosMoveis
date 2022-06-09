import 'abstract_model.dart';
import "package:mandaCakes/application.dart";
import 'package:sqflite/sqflite.dart';
class Lista extends AbstractModel{
  static late Lista _this;

  factory Lista(){
    if(_this == null){
      _this = Lista.getInstance();
    }
    return _this;
  }

  Lista.getInstance() : super();



  @override
  // TODO: implement dbname
  String get dbname => dbName;

  @override
  // TODO: implement dbversion
  int get dbversion => dbVersion;

  @override
  Future<bool> delete(dynamic id) async{
       Database db = await this.getDb();
       int rows = await db.delete(
           'produtos',
           where: 'id = ?',
           whereArgs: [id]
       );
        return rows > 0;

  }

  @override
  Future<Map> getItem(dynamic where) async{
    Database db = await this.getDb();
    List<Map> list = await db.query('produto', where: 'id = ?', whereArgs: [where], limit: 1);
    Map result = Map();
    if(list.isNotEmpty){
      result = list.first;
    }

    return result;
   
  }

  @override
  Future<int> insert(Map<String, dynamic> values) async{
    Database db = await this.getDb();
    int meuId = await db.insert('produto', values);
    return meuId;
  }

  @override
  Future<List<Map>> list() async {
    Database db = await this.getDb();
    return await db.query('Select * from produtos order by id desc');
      
    // TODO: implement list
  }

  @override
  Future<bool> update(Map<String, dynamic> values, Where) async{
       Database db = await this.getDb();
        int rows = await db.update('produto', values, where: 'id = ?', whereArgs: [Where]);

        return rows > 0;

  }

}