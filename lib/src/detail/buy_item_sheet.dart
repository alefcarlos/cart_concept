import 'package:flutter/material.dart';
import '../item_model.dart';
import 'buy_item_form.dart';

class BuyItem extends StatelessWidget {
  final Item item;
  const BuyItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      fit: StackFit.expand,
      children: <Widget>[
        BuyForm(
          item: item,
        ),
        Container(
          alignment: Alignment.topLeft,
          child: CloseButton(),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            height: 45.0,
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Icon(
                Icons.add_shopping_cart,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
