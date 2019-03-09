import 'package:flutter/material.dart';
import '../item_model.dart';

class BuyForm extends StatefulWidget {
  final Item item;
  BuyForm({@required this.item});

  @override
  _BuyFormState createState() => _BuyFormState();
}

class _BuyFormState extends State<BuyForm> {
  Item get _item => widget.item;
  TextEditingController _col = TextEditingController();
  double total = 0;

  @override
  void initState() {
    super.initState();
    total = _item.price * 1;
    _col.text = '1';
    _col.addListener(_quantityChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _col.dispose();
  }

  void _quantityChanged() {
    if (_col.text.isEmpty) return;

    setState(() {
      total = int.parse(_col.text) * _item.price;
      print(total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            _item.name,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0),
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Quantidade'),
              TextField(
                controller: _col,
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text('Preço total'),
              SizedBox(
                height: 20.0,
              ),
              Text('R\$ ${total.toStringAsFixed(2)}', style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        ),
      ],
    );
  }
}
