import 'dart:async';

import 'package:app_organicos/controle/controle_certificadora.dart';
import 'package:flutter/material.dart';

class TelaCadastroCertificadora extends StatefulWidget {
  
  ControleCertificadora _controle;
  Function _onFinishedInsert;
  TelaCadastroCertificadora(this._controle, this._onFinishedInsert);

  @override
  _TelaCadastroCertificadoraState createState() => _TelaCadastroCertificadoraState(this._controle, this._onFinishedInsert);
}

class _TelaCadastroCertificadoraState extends State<TelaCadastroCertificadora> {
  ControleCertificadora _controle;
  Function _onFinishedInsert;

  var _chaveFormulario = GlobalKey<FormState>();
  _TelaCadastroCertificadoraState(this._controle, this._onFinishedInsert);

  void _acaoBotaoSalvar(BuildContext context) {
    if (_chaveFormulario.currentState != null && _chaveFormulario.currentState.validate()) {
      _chaveFormulario.currentState.save();
      _controle.gravarCertificadoraEmEdicao().then((value) {
        if (_onFinishedInsert != null) _onFinishedInsert();
        Navigator.of(context).pop();
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cadastro de Certificadora")),
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
                    borderSide: BorderSide(color: Colors.teal)
                  ),
                  filled: true,
                  hintText: "Nome",
                  labelText: "Nome"
                ),
                keyboardType: TextInputType.text,
                initialValue: _controle.certificadoraEmEdicao.nome,
                onSaved: (String value) {
                  _controle.certificadoraEmEdicao.nome = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o nome da Certificadora";
                  }
                  return null;
                }
              ),
            ],
          ),
        ),
      ),   
    );
  }
}