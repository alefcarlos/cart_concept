import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../item_model.dart';
import 'bottom_bar.dart';
import 'detail_identity.dart';
import '../shared/separator.dart';
import '../price.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  DetailPage(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Column(
          children: <Widget>[
            DetailIdentity(item: item),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                item.name,
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: SmoothStarRating(
                rating: item.rating,
                size: 24,
                color: Colors.yellow,
              ),
            ),
            Separator(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Price(
                item: item,
                listPriceStyle: TextStyle(
                  color: Colors.white70,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                discountPriceStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontSize: 24.0,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DetailBottomBar(item: item),
    );
  }
}
