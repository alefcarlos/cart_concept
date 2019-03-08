import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../item_model.dart';

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
            Stack(
              children: <Widget>[
                Container(
                  child: Hero(
                    tag: 'tag_${item.id}',
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 300.0,
                        width: MediaQuery.of(context).size.width,
                        imageUrl: item.mainImageURI,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error_outline)),
                  ),
                  constraints: BoxConstraints.expand(height: 300.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 190.0),
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
            ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: CloseButton(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur adipiscing, elit libero mi magna leo. Ultrices dapibus blandit parturient taciti pulvinar sodales placerat consequat in, etiam aenean phasellus enim porta hac ligula nunc, vulputate facilisis sociosqu duis eros per feugiat nulla. Semper libero mattis iaculis quisque scelerisque natoque elementum sollicitudin cubilia ridiculus nisi fermentum, vestibulum habitant platea commodo litora molestie tellus cras risus sed maecenas aliquam, lacus turpis senectus at facilisi potenti id class taciti ante aliquet.',
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
