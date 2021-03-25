import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection _conexaoPostgreSQL;

  static Future<PostgreSQLConnection> getConexao() async {
    if (_conexaoPostgreSQL == null || _conexaoPostgreSQL.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection(
          "192.168.25.22", 5432, "organicos",
          username: "postgres", password: "s1st3m@s");
      await _conexaoPostgreSQL.open();
    }
    return _conexaoPostgreSQL;
  }
}
