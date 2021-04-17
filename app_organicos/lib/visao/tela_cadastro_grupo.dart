import 'package:app_organicos/controle/controle_cidade.dart';
import 'package:app_organicos/controle/controle_estado.dart';
import 'package:app_organicos/controle/controle_grupo.dart';
import 'package:app_organicos/modelo/estado.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modelo/cidade.dart';

class TelaCadastroGrupo extends StatefulWidget {
  //Controle do produto:
  ControleGrupo _controle;

  //Recebe uma função por parametro, é executa apos terminar o processo de insert
  Function _onFinishedInsert;

  //construtor da tela
  TelaCadastroGrupo(this._controle, this._onFinishedInsert);

  @override
  _TelaCadastroGrupoState createState() =>
      //construtor da tela, recebe um controle e uma função
      _TelaCadastroGrupoState(this._controle, this._onFinishedInsert);
}

//Classe de estado, define a estrutura e o estado da tela:
class _TelaCadastroGrupoState extends State<TelaCadastroGrupo> {
  //Instancia o controlador:
  ControleGrupo _controle;

  //Instancia o controle Estado:
  ControleEstado _controleEstado = ControleEstado();

  //Instancia o controle da Cidade:
  ControleCidade _controleCidade = ControleCidade();
  //Instancia o controle da Cidade:
  //ControleCidade _controleCidade = Controlecidade();

  //funcao:é executa apos terminar o processo de insert
  Function _onFinishedInsert;

  //Refencia um widge , referencia , identifica, ponteiro para os widget
  var _chaveFormulario = GlobalKey<FormState>();
  //Construtor de estados da tela, recebe um controle e a função é executa apos terminar
  _TelaCadastroGrupoState(this._controle, this._onFinishedInsert);

  //Metodo para o toão salvar:
  void _acaoBotaoSalvar(BuildContext context) {
    //Valisa se o formulario esta ativo, se algum validador retornou algo
    if (_chaveFormulario.currentState != null &&
        //chama o validade de cada campo
        _chaveFormulario.currentState.validate()) {
      //Sava chama o metodo e passa os campos para o objeto
      _chaveFormulario.currentState.save();
      //valva o grupo em edição: apos terminar de gravar then ....
      //faça o fechamento da tela
      _controle.gravarGrupoEmEdicao().then((value) {
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
          title: Center(child: Text("Cadastro de Grupo")),
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
                      initialValue: _controle.grupoEmEdicao.nome,
                      //depois de valvo, coloca o valor no objeto
                      onSaved: (String value) {
                        _controle.grupoEmEdicao.nome = value;
                      },
                      //validador do campo - retorna um string caso nao passe
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o nome do grupo!";
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
                      initialValue: _controle.grupoEmEdicao.cnpj,
                      onSaved: (String value) {
                        _controle.grupoEmEdicao.cnpj = value;
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
                      initialValue: _controle.grupoEmEdicao.endereco,
                      onSaved: (String value) {
                        _controle.grupoEmEdicao.endereco = value;
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
                      initialValue: _controle.grupoEmEdicao.numero,
                      onSaved: (String value) {
                        _controle.grupoEmEdicao.numero = value;
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
                      initialValue: _controle.grupoEmEdicao.bairro,
                      onSaved: (String value) {
                        _controle.grupoEmEdicao.bairro = value;
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
                        //recebe a lista vinda do banco: lista vazia ou lista cheia
                        List<Estado> listaEstados =
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
                          value: _controle.grupoEmEdicao.cidade,

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
                              _controle.grupoEmEdicao.cidade = value;
                            });
                          },
                        );
                      }),

                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  //Campo inscricaoEstadual
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          //fundo
                          filled: true,
                          //icone antes do texto
                          //prefixIcon: Icon(Icons.person),
                          //texto dentro do campo:
                          hintText: "Inscricao Estadual",
                          //Texto sobre o campo:
                          labelText: "Inscricao Estadual"),
                      //Tipo de dado que o campo aceita: Definir o tipo do teclado
                      keyboardType: TextInputType.text,
                      //valor inicial co sontrle
                      initialValue: _controle.grupoEmEdicao.inscricaoEstadual,
                      //depois de valvo, coloca o valor no objeto
                      onSaved: (String value) {
                        _controle.grupoEmEdicao.inscricaoEstadual = value;
                      },
                      //validador do campo - retorna um string caso nao passe
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a Incricao Estadual!";
                        }
                        return null;
                      }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                  // //Campo distribuidor
                  // TextFormField(
                  //     decoration: const InputDecoration(
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.teal)),
                  //         //fundo
                  //         filled: true,
                  //         //icone antes do texto
                  //         //prefixIcon: Icon(Icons.person),
                  //         //texto dentro do campo:
                  //         hintText: "distribuidor",
                  //         //Texto sobre o campo:
                  //         labelText: "distribuidor"),
                  //     //Tipo de dado que o campo aceita: Definir o tipo do teclado
                  //     keyboardType: TextInputType.text,
                  //     //valor inicial co sontrle
                  //     initialValue: _controle.grupoEmEdicao.distribuidor,
                  //     //depois de valvo, coloca o valor no objeto
                  //     onSaved: (String value) {
                  //       _controle.grupoEmEdicao.distribuidor = value;
                  //     },
                  //     //validador do campo - retorna um string caso nao passe
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "Informe o distribuidor!";
                  //       }
                  //       return null;
                  //     }),
                  //Separador
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}
