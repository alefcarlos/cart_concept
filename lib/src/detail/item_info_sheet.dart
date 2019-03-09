import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: SingleChildScrollView(
              child: Text(
                'Lorem ipsum dolor sit amet consectetur adipiscing, elit libero mi magna leo. Ultrices dapibus blandit parturient taciti pulvinar sodales placerat consequat in, etiam aenean phasellus enim porta hac ligula nunc, vulputate facilisis sociosqu duis eros per feugiat nulla. Semper libero mattis iaculis quisque scelerisque natoque elementum sollicitudin cubilia ridiculus nisi fermentum, vestibulum habitant platea commodo litora molestie tellus cras risus sed maecenas aliquam, lacus turpis senectus at facilisi potenti id class taciti ante aliquet.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        )
      ],
    );
  }
}
