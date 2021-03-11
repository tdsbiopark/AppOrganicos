import 'package:app_organicos/controle/controle_produtor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCadastroProdutor extends StatefulWidget {
  //Controle do produto:
  ControleProdutor _controle;

  //Recebe uma função por parametro, é executa apos terminar o processo de insert
  Function _onFinishedInsert;

  //construtor da tela
  TelaCadastroProdutor(this._controle, this._onFinishedInsert);

  @override
  _TelaCadastroProdutorState createState() =>
      //construtor da tela, recebe um controle e uma função
      _TelaCadastroProdutorState(this._controle, this._onFinishedInsert);
}

//Classe de estado, define a estrutura e o estado da tela:
class _TelaCadastroProdutorState extends State<TelaCadastroProdutor> {
  //Instancia o controlador:
  ControleProdutor _controle;

  //Instancia o controle da Cidade:
  //ControleCidade _controleCidade = Controlecidade();

  //Instancia o controle do Grupo:
  //ControleGrupo _controleGrupo = ControleGrupo();

  //Instancia o controle do Certificadora:
  //ControleCertificadora _controleCertificadora = ControleCertificadora();

  //funcao:é executa apos terminar o processo de insert
  Function _onFinishedInsert;

  //Refencia um widge , referencia , identifica, ponteiro para os widget
  var _chaveFormulario = GlobalKey<FormState>();
  //Construtor de estados da tela, recebe um controle e a função é executa apos terminar
  _TelaCadastroProdutorState(this._controle, this._onFinishedInsert);

  //Metodo para o toão salvar:
  void _acaoBotaoSalvar(BuildContext context) {
    //Valisa se o formulario esta ativo, se algum validador retornou algo
    if (_chaveFormulario.currentState != null &&
        //chama o validade de cada campo
        _chaveFormulario.currentState.validate()) {
      //Sava chama o metodo e passa os campos para o objeto
      _chaveFormulario.currentState.save();
      //valva o produtor em edição: apos terminar de gravar then ....
      //faça o fechamento da tela
      _controle.gravarProdutorEmEdicao().then((value) {
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
          title: Center(child: Text("Cadastro de Produtor")),
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
                      initialValue: _controle.produtorEmEdicao.nome,
                      //depois de valvo, coloca o valor no objeto
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.nome = value;
                      },
                      //validador do campo - retorna um string caso nao passe
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o nome do produtor!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo Nome propriedade:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Nome Propriedade",
                          labelText: "Nome Propriedade"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtorEmEdicao.nomePropriedade,
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.nomePropriedade = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o nome da propriedade!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),

                  //Campo CNP CPF:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "CPF/CNPJ",
                          labelText: "CPF/CNPJ"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtorEmEdicao.cpfCnpj,
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.cpfCnpj = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe CPF ou CNPJ!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo Endereço:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Endereço",
                          labelText: "Endereço"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtorEmEdicao.endereco,
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.endereco = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe endereço!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo Numero:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Numero",
                          labelText: "Numero"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtorEmEdicao.numero,
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.numero = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe numero!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo Bairro:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Bairro",
                          labelText: "Bairro"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtorEmEdicao.bairro,
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.bairro = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o bairro!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),

                  //Cidade...
                  //
                  //
                  //
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo Telefone:
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Telefone",
                          labelText: "Telefone"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtorEmEdicao.telefone,
                      onSaved: (String value) {
                        _controle.produtorEmEdicao.telefone = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o Telefone!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  // Grupo...
                  //
                  //
                  //
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Certificadora...
                  //
                  //
                  //
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Separador:
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}