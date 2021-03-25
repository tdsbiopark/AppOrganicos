import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection _conexaoPostgreSQL;

  static Future<PostgreSQLConnection> getConexao() async {
    if (_conexaoPostgreSQL == null || _conexaoPostgreSQL.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection(
          "192.168.0.105", 5432, "organicos",
          username: "postgres", password: "Alan@camila01");
      await _conexaoPostgreSQL.open();
    }
    return _conexaoPostgreSQL;
  }
}
