import 'package:app_organicos/controle/controle_produto.dart';
import 'package:app_organicos/controle/controle_tipoproduto.dart';
import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:flutter/material.dart';

class TelaCadastroProduto extends StatefulWidget {
  //Controle do produto:
  ControleProduto _controle;

  //Recebe uma função por parametro, é executa apos terminar o processo de insert
  Function _onFinishedInsert;

  //construtor da tela
  TelaCadastroProduto(this._controle, this._onFinishedInsert);

  @override
  _TelaCadastroProdutoState createState() =>
      //construtor da tela, recebe um controle e uma função
      _TelaCadastroProdutoState(this._controle, this._onFinishedInsert);
}

//Classe de estado, define a estrutura e o estado da tela:
class _TelaCadastroProdutoState extends State<TelaCadastroProduto> {
  //Instancia o controlador:
  ControleProduto _controle;

  //Instancia o controle do tipo produto:
  ControleTipoProduto _controleTipoProduto = ControleTipoProduto();

  //funcao:é executa apos terminar o processo de insert
  Function _onFinishedInsert;

  //Refencia um widge , referencia , identifica, ponteiro para os widget
  var _chaveFormulario = GlobalKey<FormState>();
  //Construtor de estados da tela, recebe um controle e a função é executa apos terminar
  _TelaCadastroProdutoState(this._controle, this._onFinishedInsert);

  //Metodo para o toão salvar:
  void _acaoBotaoSalvar(BuildContext context) {
    //Valisa se o formulario esta ativo, se algum validador retornou algo
    if (_chaveFormulario.currentState != null &&
        //chama o validade de cada campo
        _chaveFormulario.currentState.validate()) {
      //Sava chama o metodo e passa os campos para o objeto
      _chaveFormulario.currentState.save();
      //valva o produto em edição: apos terminar de gravar then ....
      //faça o fechamento da tela
      _controle.gravarProdutoEmEdicao().then((value) {
        //e o metodo for diferente de null executa o metodo
        if (_onFinishedInsert != null) _onFinishedInsert();
        //Pop - tira a tela da pilha
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Containner base da tela:
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Cadastro de Produtos")),
        ),
        //Botão salvar
        floatingActionButton: FloatingActionButton(
          //Icone Salvar
          child: Icon(Icons.check),
          //Evento:
          onPressed: () {
            //metodo ação de salvar
            _acaoBotaoSalvar(context);
          },
        ),
        //Definir o corpo do formulario Reforna o form com os campos
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              //referncia:
              key: _chaveFormulario,
              //A lista vice é melhot que a Collumn, pos permite rolar a tela
              //o Formne cabe na tela,Não estoura a tela
              child: ListView(
                children: <Widget>[
                  //Campo Nome
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          //fundo
                          filled: true,
                          //icone antes do texto
                          //prefixIcon: Icon(Icons.person),
                          //texto dentro do campo:
                          hintText: "Nome",
                          //Texto sobre o campo:
                          labelText: "Nome"),
                      //Tipo de dado que o campo aceita: Definir o tipo do teclado
                      keyboardType: TextInputType.text,
                      //valor inicial co sontrle
                      initialValue: _controle.produtoEmEdicao.nome,
                      //depois de valvo, coloca o valor no objeto
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.nome = value;
                      },
                      //validador do campo - retorna um string caso nao passe
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o nome do produto!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo Descreição:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Descrição",
                          labelText: "Descrição"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtoEmEdicao.descricao,
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.descricao = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a descrição do produto!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Combobox
                  FutureBuilder(
                      future: _controleTipoProduto.listar(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        String labelCampo = "Tipo Produto";
                        //Se nao tem dados...
                        if (!snapshot.hasData) {
                          labelCampo = "Carregando Lista de Dados...";
                        }
                        //recebe a lista vinda do banco: lista vazi ou lista cheia
                        List<TipoProduto> listaTipos =
                            snapshot.data == null ? List() : snapshot.data;
                        //
                        return DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              filled: true,
                              isDense: true,
                              prefixIcon: Icon(Icons.assignment_ind),
                              hintText: labelCampo,
                              labelText: labelCampo),
                          isExpanded: true,
                          //lista de objetos:
                          items: listaTipos
                              //mapeia a lista de objetos semelhante ao foreach
                              .map<DropdownMenuItem<TipoProduto>>(
                                  (TipoProduto tipo) =>
                                      DropdownMenuItem<TipoProduto>(
                                        value: tipo,
                                        //texto que vai aparcer
                                        child: Text(tipo.nome,
                                            textAlign: TextAlign.left),
                                      ))
                              //ja lista
                              .toList(),

                          //recebe o objeto
                          value: _controle.produtoEmEdicao.tipo,

                          //validação do campo:
                          validator: (value) {
                            if (value == null) {
                              return "Informe o tipo do produto!";
                            }
                            return null;
                          },

                          //ao seleciona ja refelete no objeto
                          onChanged: (TipoProduto value) {
                            setState(() {
                              _controle.produtoEmEdicao.tipo = value;
                            });
                          },
                        );
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo preço
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Preço Unitário",
                          labelText: "Preço Unitario"),
                      //Tipo de dado que aceita:
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      //valida se o valor for null, deixa vazio:
                      initialValue: _controle.produtoEmEdicao.preco == null
                          ? ""
                          : _controle.produtoEmEdicao.preco.toString(),
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.preco =
                            //tenta converter...
                            double.tryParse(value);
                      },
                      //Validação do campo:
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o preço do produto!";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.ac_unit),
                          hintText: "Unidade",
                          labelText: "Unidade"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtoEmEdicao.unidade,
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.unidade = value;
                      },

                      //Validador:
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a unidade do produto!";
                        }
                        return null;
                      }),
                  //Separador:
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}
