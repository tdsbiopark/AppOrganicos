import 'package:app_organicos/visao/tela_cadastro_grupo.dart';
import 'package:app_organicos/visao/tela_pesquisa_grupo.dart';
import 'package:app_organicos/visao/tela_pesquisa_produto.dart';
import 'package:app_organicos/visao/tela_pesquisa_produtor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Organicos IFPR',
      debugShowCheckedModeBanner: false, //tira sele debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: TelaPesquisaGrupo(),
      //home: TelaPesquisaProdutor(),
      //home: TelaPesquisaProduto(),
    );
  }
}
