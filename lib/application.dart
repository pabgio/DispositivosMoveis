String dbName = 'mandaCakes.db';
int dbVersion = 1;

List<String> dbCreate = [
  """
    CREATE TABLE produtos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      preco REAL NOT NULL,
      imagem TEXT NOT NULL,
      descricao TEXT NOT NULL
    );    
"""
      """
    CREATE TABLE carrinho (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      produto_id INTEGER NOT NULL,
      quantidade INTEGER NOT NULL,
      FOREIGN KEY (produto_id) REFERENCES produtos (id)
    );
"""
"""
    CREATE TABLE usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      email TEXT NOT NULL,
      senha TEXT NOT NULL
    );
"""
];
