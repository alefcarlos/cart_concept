import 'package:flutter/material.dart';
import 'item_model.dart';

class Price extends StatelessWidget {
  final Item item;
  final TextStyle listPriceStyle;
  final TextStyle discountPriceStyle;
  Price({@required this.item, this.listPriceStyle, this.discountPriceStyle});

  @override
  Widget build(BuildContext context) {
    var _listPriceStyle = listPriceStyle ??
        TextStyle(
            color: Colors.white70,
            fontSize: 16.0,
            fontWeight: FontWeight.bold);

    if (item.hasDiscount) {
      _listPriceStyle = _listPriceStyle.copyWith(
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.lineThrough);
    }

    return Wrap(
      alignment: WrapAlignment.start,
      children: <Widget>[
        Text(
          'R\$ ${item.listPrice.toStringAsFixed(2)}',
          style: _listPriceStyle,
        ),
        Visibility(
          visible: item.hasDiscount,
          child: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'R\$ ${item.discountPrice.toStringAsFixed(2)}',
              style: discountPriceStyle ??
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
