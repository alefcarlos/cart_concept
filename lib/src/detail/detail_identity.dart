import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../item_model.dart';

class DetailIdentity extends StatelessWidget {
  const DetailIdentity({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Hero(
            tag: 'tag_${item.id}',
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                imageUrl: item.mainImageURI,
                placeholder: (context, url) =>
                    CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error_outline)),
          ),
          constraints: BoxConstraints.expand(height: 200.0),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.0),
          height: 110.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
              stops: [0.0, 0.9],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: BackButton(color: Colors.white),
        ),
      ],
    );
  }
}