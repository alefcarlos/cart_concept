import 'package:flutter/material.dart';
import 'card.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
      body: ItemCard(),
    );
  }
}
