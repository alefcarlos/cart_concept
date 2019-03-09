import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';
import '../item_model.dart';
import 'item_info_sheet.dart';
import 'buy_item_sheet.dart';

class DetailBottomBar extends StatelessWidget {
  final Item item;
  const DetailBottomBar({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF736AB7),
      elevation: 0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              showRoundedModalBottomSheet<void>(
                dismissOnTap: false,
                radius: 10.0,
                context: context,
                builder: (BuildContext context) {
                  return BuyItem(item: item);
                },
              ).whenComplete(() {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: new Text('Item foi comprado com sucesso!'),
                  duration: const Duration(seconds: 1),
                ));
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              showRoundedModalBottomSheet<void>(
                dismissOnTap: false,
                radius: 10.0,
                context: context,
                builder: (BuildContext context) {
                  return ItemInfo();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
