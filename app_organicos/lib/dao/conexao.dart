import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection _conexaoPostgreSQL;

  static Future<PostgreSQLConnection> getConexao() async {
    if (_conexaoPostgreSQL == null || _conexaoPostgreSQL.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection("10.0.0.126", 5432, "organicos",
          username: "postgres", password: "postgres");
      await _conexaoPostgreSQL.open();
    }

    return _conexaoPostgreSQL;
  }
}
