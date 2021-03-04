import 'package:app_organicos/controle/controle_produto.dart';
import 'package:app_organicos/controle/controle_tipoproduto.dart';
import 'package:app_organicos/modelo/tipo_produto.dart';
import 'package:flutter/material.dart';

class TelaCadastroProduto extends StatefulWidget {
  ControleProduto _controle;
  Function _onFinishedInsert;

  TelaCadastroProduto(this._controle, this._onFinishedInsert);

  @override
  _TelaCadastroProdutoState createState() =>
      _TelaCadastroProdutoState(this._controle, this._onFinishedInsert);
}

class _TelaCadastroProdutoState extends State<TelaCadastroProduto> {
  ControleProduto _controle;
  Function _onFinishedInsert;

  ControleTipoProduto _controleTipoProduto = ControleTipoProduto();
  var _chaveFormulario = GlobalKey<FormState>();

  _TelaCadastroProdutoState(this._controle, this._onFinishedInsert);

  void _acaoBotaoSalvar(BuildContext context) {
    if (_chaveFormulario.currentState != null && _chaveFormulario.currentState.validate()) {
      _chaveFormulario.currentState.save();
      _controle.gravarProdutoEmEdicao().then((value) {
        if (_onFinishedInsert != null) _onFinishedInsert();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Cadastro de Produtos")),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            _acaoBotaoSalvar(context);
          },
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _chaveFormulario,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Nome",
                          labelText: "Nome"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtoEmEdicao.nome,
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.nome = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe o nome do produto!";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
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
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: _controleTipoProduto.listar(),
                      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                        String labelCampo = "Tipo Produto";
                        if (!snapshot.hasData) {
                          labelCampo = "Carregando Lista de Dados...";
                        }
                        List<TipoProduto> listaTipos =
                            snapshot.data == null ? List() : snapshot.data;

                        return DropdownButtonFormField(
                          decoration: InputDecoration(
                              border:
                                  OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                              filled: true,
                              isDense: true,
                              prefixIcon: Icon(Icons.assignment_ind),
                              hintText: labelCampo,
                              labelText: labelCampo),
                          isExpanded: true,
                          items: listaTipos
                              .map<DropdownMenuItem<TipoProduto>>(
                                  (TipoProduto tipo) => DropdownMenuItem<TipoProduto>(
                                        value: tipo,
                                        child: Text(tipo.nome, textAlign: TextAlign.left),
                                      ))
                              .toList(),
                          value: _controle.produtoEmEdicao.tipo,
                          validator: (value) {
                            if (value == null) {
                              return "Informe o tipo do produto!";
                            }
                            return null;
                          },
                          onChanged: (TipoProduto value) {
                            setState(() {
                              _controle.produtoEmEdicao.tipo = value;
                            });
                          },
                        );
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Preço Unitário",
                          labelText: "Preço Unitario"),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      initialValue: _controle.produtoEmEdicao.preco == null
                          ? ""
                          : _controle.produtoEmEdicao.preco.toString(),
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.preco = double.tryParse(value);
                      },
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
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                          filled: true,
                          // prefixIcon: Icon(Icons.person),
                          hintText: "Unidade",
                          labelText: "Unidade"),
                      keyboardType: TextInputType.text,
                      initialValue: _controle.produtoEmEdicao.unidade,
                      onSaved: (String value) {
                        _controle.produtoEmEdicao.unidade = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a unidade do produto!";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}
