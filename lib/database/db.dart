import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB{
  DB._();
  static final DB db = DB._();
  static Database? _database;

 get database async {
    if (_database != null) return _database;
    return _database = await initDatabase();

 }

  initDatabase() async {
    return  await openDatabase(
      join(await getDatabasesPath(), 'mandaCakes.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }
   _onCreate(db, versao) async {
    await db.execute(_carrinho);
    await db.execute(_produtos);
    await db.execute(_usuarios);
   }

  static const String _carrinho = '''
  CREATE TABLE IF NOT EXISTS carrinho (
    id INTEGER PRIMARY KEY,
    produto TEXT,
    quantidade INTEGER,
    preco REAL
  )
  ''';

  static const String _produtos = '''
  CREATE TABLE IF NOT EXISTS produtos (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    preco REAL,
    quantidade INTEGER,
    imagem TEXT
  )
  ''';

  static const String _usuarios = '''
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    email TEXT,
    celular TEXT,
    senha TEXT
  )
  ''';
  

}