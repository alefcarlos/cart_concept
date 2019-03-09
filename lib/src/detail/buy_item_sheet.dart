import 'package:flutter/material.dart';
import '../item_model.dart';
import 'buy_item_form.dart';

class BuyItem extends StatelessWidget {
  final Item item;
  const BuyItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: CloseButton(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: BuyForm(item: item),
        )
      ],
    );
  }
}
