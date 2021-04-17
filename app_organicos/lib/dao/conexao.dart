import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection _conexaoPostgreSQL;

  static Future<PostgreSQLConnection> getConexao() async {
    if (_conexaoPostgreSQL == null || _conexaoPostgreSQL.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection(
          "192.168.1.106", 5433, "organicos",
          username: "postgres", password: "postgres");
      await _conexaoPostgreSQL.open();
      await _conexaoPostgreSQL.execute("set tcp_keepalives_idle = 30;");
      await _conexaoPostgreSQL.execute("set tcp_keepalives_interval = 15;");
      await _conexaoPostgreSQL.execute("set tcp_keepalives_count = 10;");
    }
    return _conexaoPostgreSQL;
  }
}
