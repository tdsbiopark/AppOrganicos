import 'package:app_organicos/controle/controle_grupo.dart';
import 'package:app_organicos/modelo/grupo.dart';
import 'package:app_organicos/visao/tela_cadastro_grupo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TelaPesquisaGrupo extends StatefulWidget {
  TelaPesquisaGrupo({Key key}) : super(key: key);

  @override
  _TelaPesquisaGrupoState createState() => _TelaPesquisaGrupoState();
}

//Classe privada, define a estrutura da tela:
class _TelaPesquisaGrupoState extends State<TelaPesquisaGrupo> {
  //Instancia o controlador do Grupo:
  ControleGrupo _controle = ControleGrupo();

  //Cria propriedade para definir o icone
  Icon iconeBotaoPesquisa = new Icon(
    Icons.search,
    color: Colors.white,
  );

  //Titulo da barra - Criar a propriedade para definir um texto da tela
  Widget _appBarTitle = Text("Lista de Grupos");

  //Controller de campo de texto de pesquisa:
  TextEditingController _controladorPesquisa = new TextEditingController();

  //Metodo retorna widget - Retorna Barra com comportamento - Retorna o appBar
  Widget buildBar(BuildContext context) {
    //Retorna o appBar - Barra de pesquisa no topo
    return new AppBar(centerTitle: true, title: _appBarTitle, actions: <Widget>[
      //Alinha os botões na horizontal
      new IconButton(
        //definir o icone com a variavel:
        icon: iconeBotaoPesquisa,
        //Evento no botão
        onPressed: () {
          //Faz um refresh na tela, muda o estado da tela, ou seja atualiza a tela
          setState(() {
            //testa se é a lupa ou X
            if (this.iconeBotaoPesquisa.icon == Icons.search) {
              //se for pesquisa, muda para X
              this.iconeBotaoPesquisa = new Icon(
                //Cria um novo icone:
                Icons.close,
                color: Colors.white,
              );
              _appBarTitle = new TextField(
                  //campo de texto para pesquisa
                  textInputAction: TextInputAction.search,
                  //Digita primeiro e depois executar a pesquisa
                  onSubmitted: (String textoCampoPesquisa) {
                    setState(() {
                      //Atualiza a esquisa - Executa a pesquisa recebendo texto digitado no campo de pesquisa ja limitada com 50 linhas
                      _controle.atualizarPesquisa(filtro: textoCampoPesquisa);
                    });
                  },
                  controller: _controladorPesquisa,
                  //Formata o estilo do campo de texto da pesquisa
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  //monstra o efeito de texto
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Pesquisar...",
                      hintStyle: new TextStyle(color: Colors.white)),
                  autofocus: true);
            } else {
              //termine a pesquisa, muda o appBar devolta
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  //Termina a pesquisa: Retorna o appbar
  void _handleSearchEnd() {
    setState(() {
      //formata o AppBar:
      iconeBotaoPesquisa = new Icon(
        Icons.search,
        color: Colors.white,
      );
      //Retorna o titulo da tela:
      _appBarTitle = new Text(
        "Lista de Grupos",
        style: new TextStyle(color: Colors.white),
      );
      //Limpa o campo da pesquisa
      _controladorPesquisa.clear();
      //Atualiza a lista da tela:
      _controle.atualizarPesquisa();
    });
  }

  //Metoto para Formatar a lista: a cada linha recebe um grupo
  Widget _linhaListaZebrada(Grupo grupo, int indice) {
    //Componente que desliza a linha - import - adicionado a componente - aula: 03/03
    return Slidable(
        //
        actionPane: SlidableDrawerActionPane(),
        //percentual de deslise
        actionExtentRatio: 0.15,
        //containner , como se fosse uma painel - nesse containner pode por qualque coisa
        //cada linha sera um objeto, pode por comportamentos diferentes para cada linha
        child: Container(
            //retangulo de fundo
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100, width: 0.8),
                //Cor de fundo - se o indice for par usa cinza
                color: indice % 2 == 0 ? Colors.blue.shade50 : Colors.white),
            //linha de uma lista:
            child: ListTile(
              //texto da linha
              title: new Text("Nome: " + grupo.nome,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left),
            )),
        //lista de widgets - adicionado botoes
        secondaryActions: <Widget>[
          //Btão Editar:
          new IconSlideAction(
            caption: 'Editar',
            color: Colors.green,
            icon: Icons.edit,
            //Evento ao arrastar
            onTap: () {
              //Tratamento botão editar
              //Carregar aqui o grupo completo do banco quando necessário.
              Function onFinishedInsert = () {
                setState(() {
                  _controle.atualizarPesquisa();
                });
              };
              //carrega a tela com om objeto vazio, campos limpos
              _controle.grupoEmEdicao = grupo;
              //Adiciona a nova tela na pilha, Carrega a tela de cadastro para cadastrar novo grupo
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        //Instancia o formulario do grupo: mais o metodos onFinishedInsert
                        TelaCadastroGrupo(this._controle, onFinishedInsert)),
              );
            },
          ),
          //Criando botão deletar:
          new IconSlideAction(
            caption: 'Deletar',
            color: Colors.red,
            icon: Icons.delete,
            //ao clicar...
            onTap: () => setState(() {
              //chama uma caixa de mensagem
              showDialog(
                  context: context,
                  builder: (BuildContext builder) {
                    //Definir o tipo da caixa de diaglo de alerta
                    return new AlertDialog(
                      title: new Text("Confirmação"),
                      //Conteudo da caixa de mensagem
                      content:
                          new Text("Deseja realmente excluir este registro?"),
                      //lista de botões com as ações
                      actions: <Widget>[
                        //Botao:
                        new TextButton(
                            //Evento
                            onPressed: () {
                              //estado:
                              setState(() {
                                //Tratamento botão excluir
                                //Ação ao clicar no botão Editar, passa o grupo da linha para
                                //produto em edução:
                                _controle.grupoEmEdicao = grupo;
                                //quando exclui apenas desativa no banco
                                _controle.grupoEmEdicao.ativo = false;
                                //Grava com o campo ativo = false
                                _controle.gravarGrupoEmEdicao();
                                //Atualiza a lista na tela
                                setState(() {
                                  //Pega a lista, e remove o item desativado, pelo indice
                                  _controle.gruposPesquisados.removeAt(indice);
                                });
                              });
                              //Auto fecha a caixa de mensagem:
                              Navigator.of(context).pop();
                            },
                            //Testo do botão Sim
                            child: new Text("Sim")),
                        new TextButton(
                            //Evento do botão não:
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: new Text("Não")),
                      ],
                    );
                  });
            }),
          ),
        ]);
  }

  //Carrega a tela e mostra:
  @override
  Widget build(BuildContext context) {
    //Painel da TELA
    return Scaffold(
        //usa o metodo que retorna o widget appBar:
        appBar: buildBar(context),

        //Borão + no canto inferior
        floatingActionButton: FloatingActionButton(
          //Icone:
          child: Icon(Icons.add),
          //Evento:
          onPressed: () {
            //Recebe o grupo sendo editado
            _controle.grupoEmEdicao = Grupo();

            //Função responsavel por avisar a outra tele - depois te terminar de inserir
            Function onFinishedInsert = () {
              //Atualiza algo na tela
              setState(() {
                //atualiza a lista
                _controle.atualizarPesquisa();
              });
            };
            //Chamar uma nova tela através de comando/ Navegar na pilha de tela
            //push = adiciona mais uma tela na pilha ja com icone voltar
            Navigator.push(
              //contexto de Widgets
              context,
              //Retorna o objeto da nova tela
              MaterialPageRoute(
                  builder: (context) =>
                      //Chama a tela de cadastro: Recebe um controle e uma metodo por parametro
                      TelaCadastroGrupo(this._controle, onFinishedInsert)),
            );
          },
        ),
        //Corpo: onde fica a lista - recebe uma lista futura
        body: FutureBuilder(
            //lista futura de grupos: fica monitorando ela
            future: _controle.fGruposPesquisados,
            //fica monstrado algo emquando a lista não foi carrgada
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              //Retornou dados na lista?
              if (!snapshot.hasData)
                //Caso não retornou dados:
                return Center(
                    child: new Container(
                        child: Text(
                  "A consulta não retornou dados!",
                  style: TextStyle(fontSize: 20),
                )));

              //Passa a lista para uma variavel
              _controle.gruposPesquisados = snapshot.data;
              //Carregar a lista de objetos:
              return ListView.builder(
                //pega a quantidade de objetos
                itemCount: _controle.gruposPesquisados.length,
                //pega o item da linha a aplica a formação da linha
                itemBuilder: (BuildContext context, int index) {
                  //aplica o padrao a linha da lista na tela
                  return _linhaListaZebrada(
                      _controle.gruposPesquisados[index], index);
                },
              );
            }));
  }
}
