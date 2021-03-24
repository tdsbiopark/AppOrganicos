import 'package:app_organicos/modelo/certificadora.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class CertificadoraDAO {
  Future<void> gravar(Certificadora certificadora) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    await conexao.transaction((ctx) async {
      if (certificadora.id == null || certificadora.id == 0) {
        await ctx.query("""insert into certificadora 
            (nome, registro_ativo) 
             VALUES (@nome, @ativo)""", substitutionValues: {
          "nome": certificadora.nome,
          "ativo": certificadora.ativo,
        });
      } else {
        await ctx.query("""update certificadora set nome = @nome, 
        registro_ativo = @ativo where id = @id""", substitutionValues: {
          "id": certificadora.id,
          "nome": certificadora.nome,
          "ativo": certificadora.ativo,
        });
      }
    });
  }

  Future<List<Certificadora>> pesquisar(String filtro) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    List<Certificadora> certificadoras = List.empty(growable: true);

    List<
        Map<String,
            Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        """SELECT id, nome, registro_ativo  from certificadora where registro_ativo and lower(nome) like @filtro limit 50""",
        substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    for (final row in results) {
      Certificadora certificadora = Certificadora();
      certificadora.id = row["certificadora"]["id"];
      certificadora.nome = row["certificadora"]["nome"];
      certificadora.ativo = row["certificadora"]["registro_ativo"];

      certificadoras.add(certificadora);
    }
    return certificadoras;
  }
}
