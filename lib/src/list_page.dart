import 'package:flutter/material.dart';
import 'card.dart';
import 'item_model.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Item> items = [
    Item(
        1,
        'Jojo Mangá Vol. 1',
        25.90,
        10.90,
        'https://ptanime.com/wp-content/uploads/2016/10/JoJos-Bizarre-adventura-part-3-stardust-crusaders-viz-hardcover-volume1.jpg',
        3.2),
    Item(
        3,
        'Copo Breja',
        9.90,
        0,
        'https://superprix.vteximg.com.br/arquivos/ids/174959-600-600/Cerveja-Praya-Premium-Witbier-600ml.png?v=636264547141770000',
        5),
    Item(
        4,
        'Novo produto',
        25.90,
        10.90,
        'https://ptanime.com/wp-content/uploads/2016/10/JoJos-Bizarre-adventura-part-3-stardust-crusaders-viz-hardcover-volume1.jpg',
        2.6),
    Item(
        5,
        'Outro produto',
        9.90,
        0,
        'https://superprix.vteximg.com.br/arquivos/ids/174959-600-600/Cerveja-Praya-Premium-Witbier-600ml.png?v=636264547141770000',
        5),
  ];

  Widget appBarTitle = Text("Produtos");
  Icon actionIcon = Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(
                () {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = Icon(Icons.close);
                    this.appBarTitle = TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Pesquisar por um produto...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    this.actionIcon = Icon(Icons.search);
                    this.appBarTitle = Text("Produtos");
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 50.0,
            child: Text(
              'Selecione o produto desejado para visualizar os detalhes',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemCard(items[index]);
              },
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
