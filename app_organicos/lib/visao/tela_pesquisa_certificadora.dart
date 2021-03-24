import 'package:app_organicos/controle/controle_certificadora.dart';
import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/visao/tela_cadastro_certificadora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TelaPesquisaCertificadora extends StatefulWidget {
  TelaPesquisaCertificadora({Key key}) : super(key: key);

  @override
  _TelaPesquisaCertificadoraState createState() => _TelaPesquisaCertificadoraState();
}

class _TelaPesquisaCertificadoraState extends State<TelaPesquisaCertificadora> {
  ControleCertificadora _controle = ControleCertificadora();
  Icon iconeBotaoPesquisar = new Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget _appBarTitle = Text("Lista de Certificadoras");
  TextEditingController _controladorPesquisa = new TextEditingController();

  Widget buildBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: _appBarTitle, actions: <Widget>[
      new IconButton(
        icon: iconeBotaoPesquisar,
        onPressed: () {
          setState(() {
            if(this.iconeBotaoPesquisar.icon == Icons.search) {
              this.iconeBotaoPesquisar = new Icon(
                Icons.close,
                color: Colors.white,
              );
              _appBarTitle = new TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (String textoCampoPesquisa) {
                  setState(() {
                    _controle.atualizarPesquisa(filtro: textoCampoPesquisa);                    
                  });
                },
                controller: _controladorPesquisa,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                  prefixIcon: new Icon(Icons.search, color: Colors.white),
                  hintText: "Pesquisar...",
                  hintStyle: new TextStyle(color: Colors.white)
                ),
                autofocus: true,
              );

            }
            else {
              _handleSearchEnd();
            }
          });
        },
      )
    ]);
  }

  void _handleSearchEnd() {
    setState(() {
      iconeBotaoPesquisar = new Icon(
        Icons.search,
        color: Colors.white,
      );
      _appBarTitle = new Text(
        "Lista de Certificadoras",
        style: new TextStyle(color: Colors.white),
      );
      _controladorPesquisa.clear();
      _controle.atualizarPesquisa();
    });
  } 
  
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
            //Recebe o produto sendo editado
            _controle.certificadoraEmEdicao = Certificadora();

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
                      TelaCadastroCertificadora(this._controle, onFinishedInsert)),
            );
          },
        ),
        //Corpo: onde fica a lista - recebe uma lista futura
        body: FutureBuilder(
            //lista futura de produtos: fica monitorando ela
            future: _controle.fCertificadorasPesquisadas,
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
              _controle.certificadorasPesquisadas = snapshot.data;
              //Carregar a lista de objetos:
              return ListView.builder(
                //pega a quantidade de objetos
                itemCount: _controle.certificadorasPesquisadas.length,
                //pega o item da linha a aplica a formação da linha
                itemBuilder: (BuildContext context, int index) {
                  //aplica o padrao a linha da lista na tela
                  return _linhaListaZebrada(
                      _controle.certificadorasPesquisadas[index], index);
                },
              );
            }));
  }

  Widget _linhaListaZebrada(Certificadora certificadora, int indice) {
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
                title: new Text("Nome: " + certificadora.nome,
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
              //Carregar aqui o produto completo do banco quando necessário.
              Function onFinishedInsert = () {
                setState(() {
                  _controle.atualizarPesquisa();
                });
              };
              //carrega a tela com om objeto vazio, campos limpos
              _controle.certificadoraEmEdicao = certificadora;
              //Adiciona a nova tela na pilha, Carrega a tela de cadastro para cadastrar novo produto
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        //Instancia o formulario do produto: mais o metodos onFinishedInsert
                        TelaCadastroCertificadora(this._controle, onFinishedInsert)),
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
                                //Ação ao clicar no botão Editar, passa o produto da linha para
                                //produto em edução:
                                _controle.certificadoraEmEdicao = certificadora;
                                //quando exclui apenas desativa no banco
                                _controle.certificadoraEmEdicao.ativo = false;
                                //Grava com o campo ativo = false
                                _controle.gravarCertificadoraEmEdicao();
                                //Atualiza a lista na tela
                                setState(() {
                                  //Pega a lista, e remove o item desativado, pelo indice
                                  _controle.certificadorasPesquisadas
                                      .removeAt(indice);
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
}