import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection _conexaoPostgreSQL;

  static Future<PostgreSQLConnection> getConexao() async {
    if (_conexaoPostgreSQL == null || _conexaoPostgreSQL.isClosed) {
<<<<<<< HEAD
      _conexaoPostgreSQL = new PostgreSQLConnection(        
          "192.168.0.120", 5432, "bdOrganicosApp",
          username: "postgres", password: "12345678");
=======
      _conexaoPostgreSQL = new PostgreSQLConnection(
          "192.168.1.104", 5433, "organicos",
          username: "postgres", password: "postgres");
>>>>>>> DevelopMaycon
      await _conexaoPostgreSQL.open();
    }
    return _conexaoPostgreSQL;
  }
}
