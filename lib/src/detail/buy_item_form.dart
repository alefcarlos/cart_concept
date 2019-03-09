import 'package:flutter/material.dart';
import '../item_model.dart';

class BuyForm extends StatefulWidget {
  final Item item;
  BuyForm({@required this.item});

  @override
  _BuyFormState createState() => _BuyFormState();
}

class _BuyFormState extends State<BuyForm> {
  Item get _item => widget.item;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'id': '',
    'total': 0,
    'quantity': 1,
  };
  FocusNode quantityFocusNode;

  void initState() {
    quantityFocusNode = FocusNode();
    _formData['total'] = _item.price.toStringAsFixed(2);
    super.initState();
  }

  _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Navigator.pop(context);
  }

  @override
  void dispose() {
    quantityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          _item.name,
          style: TextStyle(fontSize: 16.0),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                initialValue: _formData['quantity'].toString(),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: false),
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                ),
                validator: (String value) {
                  if (value.isEmpty)
                    return 'É obrigatório informar uma quantidade';
                },
                focusNode: quantityFocusNode,
                onSaved: (String value) {
                  _formData['quantity'] = int.parse(value);
                },
              ),
              TextFormField(
                enabled: false,
                initialValue: _formData['total'].toString(),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                decoration: InputDecoration(
                  labelText: 'Total',
                ),
                onSaved: (String value) {
                  _formData['total'] = double.parse(value);
                },
              ),
              FlatButton(
                // color: Theme.of(context).accentColor,
                onPressed: _submitForm,
                child: Text('Comprar'),
              )
            ],
          ),
        ),
      ],
    );
  }

  // FocusNode nameFocusNode;
  // FocusNode totalFocusNode;

  // @override
  // void initState() {
  //   totalFocusNode = FocusNode();
  //   nameFocusNode = FocusNode();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   createCollectionBloc.dispose();
  //   totalFocusNode.dispose();
  //   nameFocusNode.dispose();
  //   super.dispose();
  // }

  // _changeColor(Color color) => setState(() {
  //       _formData['color'] = color;
  //       Navigator.of(context).pop();
  //     });

  // void _onWidgetDidBuild(Function callback) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     callback();
  //   });
  // }

  // _submitForm() {
  //   if (!_formKey.currentState.validate()) {
  //     return;
  //   }
  //   _formKey.currentState.save();

  //   var entity = Collection(
  //       0, _formData['name'], _formData['isFav'], _formData['totalItems'],
  //       rgbColor:
  //           "${_formData['color'].red},${_formData['color'].green},${_formData['color'].blue}");

  //   createCollectionBloc.dispatch(CreateCollectionEvent(entity));
  // }

  // Widget _buildSubmitButton(BuildContext context, BlocBaseState state) {
  //   if (state is CreateCollectionCreatingState) {
  //     return LoadingIndicator();
  //   }

  //   return RaisedButton(
  //     color: Theme.of(context).accentColor,
  //     onPressed: () => _submitForm(),
  //     child: Text('Salvar'),
  //   );
  // }

  // Widget _buildNameField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Nome',
  //     ),
  //     autofocus: true,
  //     focusNode: nameFocusNode,
  //     textInputAction: TextInputAction.next,
  //     validator: (String value) {
  //       if (value.isEmpty) return 'O campo nome é obrigatório!';
  //     },
  //     onSaved: (String value) {
  //       _formData['name'] = value;
  //     },
  //     onFieldSubmitted: (value) {
  //       if (value.isNotEmpty)
  //         FocusScope.of(context).requestFocus(totalFocusNode);
  //       else {
  //         showSnackBar(context, 'Informe um nome para sua coleção!');
  //       }
  //     },
  //   );
  // }

  // Widget _buildTotalItemsField() {
  //   return TextFormField(
  //     keyboardType:
  //         TextInputType.numberWithOptions(decimal: false, signed: false),
  //     decoration: InputDecoration(
  //       labelText: 'Quantidade de itens',
  //     ),
  //     validator: (String value) {
  //       if (value.isEmpty)
  //         return 'É obrigatório informar uma quantidade de itens.';
  //     },
  //     focusNode: totalFocusNode,
  //     onSaved: (String value) {
  //       _formData['totalItems'] = int.parse(value);
  //     },
  //   );
  // }

  // Widget _buildIsFavField() {
  //   return SwitchListTile(
  //     value: _formData['isFav'],
  //     onChanged: (bool value) {
  //       setState(() {
  //         _formData['isFav'] = value;
  //       });
  //     },
  //     title: Text('Marcar como favorito'),
  //   );
  // }

  // Widget _buildColorPicker() {
  //   return RaisedButton(
  //       onPressed: () {
  //         showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: Text('Selecione uma cor'),
  //               content: SingleChildScrollView(
  //                 child: BlockPicker(
  //                   pickerColor: _formData['color'],
  //                   onColorChanged: _changeColor,
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       },
  //       child: Text('Cor da coleção'),
  //       color: _formData['color'],
  //       textColor: Colors.white);
  // }

  // List<Widget> _buildFields(BuildContext context, BlocBaseState state) {
  //   return [
  //     _buildNameField(),
  //     SizedBox(
  //       height: 10.0,
  //     ),
  //     _buildTotalItemsField(),
  //     SizedBox(
  //       height: 10.0,
  //     ),
  //     _buildIsFavField(),
  //     SizedBox(
  //       height: 10.0,
  //     ),
  //     _buildColorPicker(),
  //     SizedBox(
  //       height: 10.0,
  //     ),
  //     _buildSubmitButton(context, state)
  //   ];
  // }

}
