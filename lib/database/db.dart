import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB{
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;
    
    return await _init();
  }

  _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'mandaCakes.db'),
      version: 1,
      onCreate: _onCreate,
    );

  }
  _onCreate(db, versao) async{
    await db.execute(_carrinho);
    await db.execute(_produto);
    await db.execute(_usuario);
    await db.execute(_itens);
    await db.insert('carrinho', {
      'total': 0
    
    });
  }

  String get _carrinho => '''
    CREATE TABLE carrinho (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      itens TEXT ,
      total REAL
    )
  ''';

  String get _produto => '''
    CREATE TABLE produto (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      descricao TEXT,
      quantidade INTEGER,
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

  String get _itens => '''
    CREATE TABLE itens (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      produto TEXT,
      quantidade INTEGER,
      valor REAL
    )
  ''';



}