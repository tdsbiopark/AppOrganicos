import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection _conexaoPostgreSQL;

  static Future<PostgreSQLConnection> getConexao() async {
    if (_conexaoPostgreSQL == null || _conexaoPostgreSQL.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection(        
          "192.168.0.120", 5432, "bdOrganicosApp",
          username: "postgres", password: "12345678");
      await _conexaoPostgreSQL.open();
    }
    return _conexaoPostgreSQL;
  }
}
