class Item {
  int _id;
  String _name;
  double _listPrice;
  double _discountPrice;
  String _mainImageURI;
  double _rating;

  Item(this._id, this._name, this._listPrice, this._discountPrice, this._mainImageURI, this._rating);

  int get id => _id;
  String get name => _name;
  double get listPrice => _listPrice;
  double get discountPrice => _discountPrice;
  String get mainImageURI => _mainImageURI;
  double get rating => _rating;
  bool get hasDiscount => _discountPrice > 0;
}