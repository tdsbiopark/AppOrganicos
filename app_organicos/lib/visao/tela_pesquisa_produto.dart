import 'package:app_organicos/controle/controle_produto.dart';
import 'package:app_organicos/modelo/produto.dart';
import 'package:app_organicos/visao/tela_cadastro_produto.dart';
import 'package:flutter/material.dart';

class TelaPesquisaProduto extends StatefulWidget {
  TelaPesquisaProduto({Key key}) : super(key: key);

  @override
  _TelaPesquisaProdutoState createState() => _TelaPesquisaProdutoState();
}

class _TelaPesquisaProdutoState extends State<TelaPesquisaProduto> {
  ControleProduto _controle = ControleProduto();

  Icon iconeBotaoPesquisa = new Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget _appBarTitle = Text("Lista de Produtos");
  TextEditingController _controladorPesquisa = new TextEditingController();

  Widget buildBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: _appBarTitle, actions: <Widget>[
      new IconButton(
        icon: iconeBotaoPesquisa,
        onPressed: () {
          setState(() {
            if (this.iconeBotaoPesquisa.icon == Icons.search) {
              this.iconeBotaoPesquisa = new Icon(
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
                      hintStyle: new TextStyle(color: Colors.white)),
                  autofocus: true);
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchEnd() {
    setState(() {
      iconeBotaoPesquisa = new Icon(
        Icons.search,
        color: Colors.white,
      );
      _appBarTitle = new Text(
        "Lista de Produtos",
        style: new TextStyle(color: Colors.white),
      );
      _controladorPesquisa.clear();
      _controle.atualizarPesquisa();
    });
  }

  Widget _linhaListaZebrada(Produto produto, int indice) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.8),
            color: indice % 2 == 0 ? Colors.grey.shade300 : Colors.white),
        child: ListTile(
            title: new Text(produto.nome,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.left)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildBar(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _controle.produtoEmEdicao = Produto();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaCadastroProduto(this._controle)),
            );
          },
        ),
        body: FutureBuilder(
            future: _controle.fProdutosPesquisados,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData)
                return Center(
                    child: new Container(
                        child: Text(
                  "A consulta não retornou dados!",
                  style: TextStyle(fontSize: 20),
                )));

              _controle.produtosPesquisados = snapshot.data;

              return ListView.builder(
                itemCount: _controle.produtosPesquisados.length,
                itemBuilder: (BuildContext context, int index) {
                  return _linhaListaZebrada(
                      _controle.produtosPesquisados[index], index);
                },
              );
            }));
  }
}
