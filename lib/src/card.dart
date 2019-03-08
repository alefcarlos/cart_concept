import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'detail/detail_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'price.dart';
import 'item_model.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          _CollectionItemCard(item),
          _CollectionItemThumb(item),
        ],
      ),
    );
  }
}

class _CollectionItemCard extends StatelessWidget {
  final Item item;
  _CollectionItemCard(this.item);

  static final headerTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Color(0xFF736AB7),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 4.0),
            Text(
              item.name,
              style: headerTextStyle,
            ),
            Container(height: 10.0),
            SmoothStarRating(
              rating: item.rating,
              size: 14,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              child: Price(item: item),
            )
          ],
        ),
      ),
    );
  }
}

class _CollectionItemThumb extends StatelessWidget {
  final Item item;
  _CollectionItemThumb(this.item);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => DetailPage(item),
            ),
          ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        child: Hero(
          tag: 'tag_${item.id}',
          child: CachedNetworkImage(
            imageUrl:
                item.mainImageURI,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error_outline),
            height: 92.0,
            width: 92.0,
          ),
        ),
      ),
    );
  }
}
