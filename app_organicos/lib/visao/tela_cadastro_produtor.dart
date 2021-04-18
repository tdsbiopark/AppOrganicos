import 'package:app_organicos/controle/controle_certificadora.dart';
import 'package:app_organicos/controle/controle_cidade.dart';
import 'package:app_organicos/controle/controle_estado.dart';
import 'package:app_organicos/controle/controle_grupo.dart';
import 'package:app_organicos/controle/controle_produtor.dart';
import 'package:app_organicos/modelo/certificadora.dart';
import 'package:app_organicos/modelo/estado.dart';
import 'package:app_organicos/modelo/grupo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modelo/cidade.dart';

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

  //Instancia o controle Estado:
  ControleEstado _controleEstado = ControleEstado();

  //Instancia o controle da Cidade:
  ControleCidade _controleCidade = ControleCidade();

  //Instancia o controle do Grupo:
  ControleGrupo _controleGrupo = ControleGrupo();

  //Instancia o controle do Certificadora:
  ControleCertificadora _controleCertificadora = ControleCertificadora();

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
        if (_onFinishedInsert != null)
          _onFinishedInsert(); //ao finalizar fecha a tela
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
        //Definir o corpo do formulario Retorna o form com os campos
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              //referencia:
              key: _chaveFormulario,
              //A lista é melhor que a Collumn, pos permite rolar a tela
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
                      },
                      //autofocus: true - para ja vir selecionado ao carregar a tela
                      autofocus: true),
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
                      keyboardType: TextInputType.number,
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
                      keyboardType: TextInputType.number,
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
                  //Combo estados -----------------------------------------------------
                  FutureBuilder(
                      //pegar o estado selecionado
                      future: _controleEstado.listar(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        String labelCampo = "Estado";
                        //Se nao tem dados...
                        if (!snapshot.hasData) {
                          labelCampo = "Carregando Lista de estados...";
                        }
                        //recebe a lista vinda do banco: se null lista vazia ou lista cheia
                        List<Estado> listaEstados =
                            snapshot.data == null ? List() : snapshot.data;
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
                          items: listaEstados
                              //mapeia a lista de objetos semelhante ao foreach
                              .map<DropdownMenuItem<Estado>>(
                                  (Estado estado) => DropdownMenuItem<Estado>(
                                        value: estado,
                                        //texto que vai aparecer
                                        child: Text(estado.nome,
                                            textAlign: TextAlign.left),
                                      ))
                              //ja lista
                              .toList(),
                          //recebe o objeto
                          value: _controle.estadoSelecionado,
                          //validação do campo:
                          validator: (value) {
                            if (value == null) {
                              return "Selecion o estado!";
                            }
                            return null;
                          },
                          //ao seleciona ja refelete no objeto
                          onChanged: (Estado value) {
                            setState(() {
                              _controle.estadoSelecionado = value;
                            });
                          },
                        );
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Combo Cidades -----------------------------------------------------
                  FutureBuilder(
                      //pegar o estado selecionado
                      future: _controleCidade.listar(
                          _controle.estadoSelecionado == null
                              ? 0
                              : _controle.estadoSelecionado.id),
                      //future: _controleCidade.listar(16),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        String labelCampo = "Cidade";
                        //Se nao tem dados...
                        if (!snapshot.hasData) {
                          labelCampo = "Carregando Lista de Cidades...";
                        }
                        //recebe a lista vinda do banco: lista vazi ou lista cheia
                        List<Cidade> listaCidades =
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
                          items: listaCidades
                              .map<DropdownMenuItem<Cidade>>(
                                  (Cidade cidade) => DropdownMenuItem<Cidade>(
                                        value: cidade,
                                        //texto que vai aparcer
                                        child: Text(cidade.nome,
                                            textAlign: TextAlign.left),
                                      ))
                              //ja lista
                              .toList(),
                          //recebe o objeto
                          value: _controle.produtorEmEdicao.cidade,

                          //validação do campo:
                          validator: (value) {
                            if (value == null) {
                              return "Selecion a cidade!";
                            }
                            return null;
                          },

                          //ao seleciona ja refelete no objeto
                          onChanged: (Cidade value) {
                            setState(() {
                              _controle.produtorEmEdicao.cidade = value;
                            });
                          },
                        );
                      }),

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
                      keyboardType: TextInputType.number,
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
                  FutureBuilder(
                      future: _controleCertificadora.listar(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        String labelCampo = "Certificadora";
                        //Se nao tem dados...
                        if (!snapshot.hasData) {
                          labelCampo = "Carregando Lista de Certificadoras...";
                        }
                        //recebe a lista vinda do banco: lista vazi ou lista cheia
                        List<Certificadora> listaTipos =
                            snapshot.data == null ? List() : snapshot.data;
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
                              .map<DropdownMenuItem<Certificadora>>(
                                  (Certificadora tipo) =>
                                      DropdownMenuItem<Certificadora>(
                                        value: tipo,
                                        //texto que vai aparcer
                                        child: Text(tipo.nome,
                                            textAlign: TextAlign.left),
                                      ))
                              //ja lista
                              .toList(),

                          //recebe o objeto
                          value: _controle.produtorEmEdicao.certificadora,

                          //validação do campo:
                          validator: (value) {
                            if (value == null) {
                              return "Selecione a certificadora!";
                            }
                            return null;
                          },

                          //ao seleciona ja reflete no objeto
                          onChanged: (Certificadora value) {
                            setState(() {
                              _controle.produtorEmEdicao.certificadora = value;
                            });
                          },
                        );
                      }),

                  SizedBox(
                    height: 10,
                  ),

                  FutureBuilder(
                      future: _controleGrupo.listar(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        String labelCampo = "Grupo/Cooperativa";
                        //Se nao tem dados...
                        if (!snapshot.hasData) {
                          labelCampo = "Carregando Lista de grupos...";
                        }
                        //recebe a lista vinda do banco: lista vazi ou lista cheia
                        List<Grupo> listaTipos =
                            snapshot.data == null ? List() : snapshot.data;
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
                              .map<DropdownMenuItem<Grupo>>(
                                  (Grupo tipo) => DropdownMenuItem<Grupo>(
                                        value: tipo,
                                        //texto que vai aparcer
                                        child: Text(tipo.nome,
                                            textAlign: TextAlign.left),
                                      ))
                              //ja lista
                              .toList(),
                          //recebe o objeto
                          value: _controle.produtorEmEdicao.grupo,

                          //validação do campo:
                          validator: (value) {
                            if (value == null) {
                              return "Selecione o grupo!";
                            }
                            return null;
                          },
                          //ao seleciona ja refelete no objeto
                          onChanged: (Grupo value) {
                            setState(() {
                              _controle.produtorEmEdicao.grupo = value;
                            });
                          },
                        );
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
