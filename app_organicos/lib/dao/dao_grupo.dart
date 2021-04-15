import 'package:app_organicos/modelo/grupo.dart';
import 'package:postgres/postgres.dart';
import 'conexao.dart';

class GrupoDAO {
  Future<void> gravar(Grupo grupo) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    await conexao.transaction((ctx) async {
      if (grupo.id == null || grupo.id == 0) {
        await ctx.query("""INSERT INTO public.grupo(
              nome, endereco, numero, bairro, cidade_id, cnpj, inscricao_estadual, distribuidor_produtos, registro_ativo) 
             VALUES (@nome, @endereco, @numero, @bairro, @cidade_id, @cnpj, @inscricao_estadual, @distribuidor_produtos, @registro_ativo)""",
            substitutionValues: {
              "nome": grupo.nome,
              "endereco": grupo.endereco,
              "numero": grupo.numero,
              "bairro": grupo.bairro,
              "cidade_id": grupo.cidade.id,
              "cnpj": grupo.cnpj,
              "inscricao_estadual": grupo.incricaoEstadual,
              "distribuidor_produtos": grupo.distribuidor,
              "registro_ativo": grupo.ativo,
            });
      } else {
        await ctx.query("""UPDATE public.grupo
	          SET nome=@nome, endereco=@endereco, numero=@numero, bairro=@bairro, cidade_id=@cidade_id, cnpj=@cnpj, inscricao_estadual=@inscricao_estadual, distribuidor_produtos=@distribuidor_produtos, registro_ativo=@registro_ativo where id = @id""",
            substitutionValues: {
              "nome": grupo.nome,
              "endereco": grupo.endereco,
              "numero": grupo.numero,
              "bairro": grupo.bairro,
              "cidade_id": grupo.cidade.id,
              "cnpj": grupo.cnpj,
              "inscricao_estadual": grupo.incricaoEstadual,
              "distribuidor_produtos": grupo.distribuidor,
              "registro_ativo": grupo.ativo,
            });
      }
    });
  }

  Future<List<Grupo>> pesquisar(String filtro) async {
    PostgreSQLConnection conexao = await Conexao.getConexao();
    List<Grupo> Grupos = List.empty(growable: true);

    List<
        Map<String,
            Map<String, dynamic>>> results = await conexao.mappedResultsQuery(
        """SELECT id, nome, endereco, numero, bairro, cidade_id, cnpj, inscricao_estadual, distribuidor_produtos, registro_ativo from Grupo where registro_ativo = true and lower(nome) like @filtro limit 50""",
        substitutionValues: {"filtro": "%" + filtro.toLowerCase() + "%"});

    for (final row in results) {
      Grupo grupo = Grupo();
      grupo.id = row["Grupo"]["id"];
      grupo.nome = row["Grupo"]["nome"];
      grupo.endereco = row["Grupo"]["endereco"];
      grupo.numero = row["Grupo"]["numero"];
      grupo.bairro = row["Grupo"]["bairro"];
      grupo.cidade.id = row["Grupo"]["cidade_id"];
      grupo.cnpj = row["Grupo"]["cnpj"];
      grupo.incricaoEstadual = row["Grupo"]["inscricao_estadual"];
      grupo.distribuidor = row["Grupo"]["distribuidor_produtos"];
      grupo.ativo = row["Grupo"]["ativo"];

      Grupos.add(grupo);
    }
    return Grupos;
  }
}
