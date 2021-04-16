import 'package:app_organicos/controle/controle_tipoproduto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCadastroTipoProduto extends StatefulWidget {
  ControleTipoProduto _controle;
  Function _onFinishedInsert;
  TelaCadastroTipoProduto(this._controle, this._onFinishedInsert);

  @override
  _TelaCadastroTipoProdutoState createState() =>
      _TelaCadastroTipoProdutoState(this._controle, this._onFinishedInsert);
}

class _TelaCadastroTipoProdutoState extends State<TelaCadastroTipoProduto> {
  ControleTipoProduto _controle;
  Function _onFinishedInsert;
  var _chaveFormulario = GlobalKey<FormState>();
  _TelaCadastroTipoProdutoState(this._controle, this._onFinishedInsert);

  void _acaoBotaoSalvar(BuildContext context) {
    if (_chaveFormulario.currentState != null &&
        _chaveFormulario.currentState.validate()) {
      _chaveFormulario.currentState.save();
      _controle.gravarTipoProdutoEmEdicao().then((value) {
        if (_onFinishedInsert != null) _onFinishedInsert();
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cadastro tipo de produto")),
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
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      filled: true,
                      hintText: "Nome",
                      labelText: "Nome"),
                  keyboardType: TextInputType.text,
                  initialValue: _controle.tipoProdutoEmEdicao.nome,
                  onSaved: (String value) {
                    _controle.tipoProdutoEmEdicao.nome = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe o tipo de Produto";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
