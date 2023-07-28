import 'package:ShoppingList/src/components/ItemCard.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:ShoppingList/src/model/Item.dart';
import 'package:ShoppingList/src/model/Api.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key, this.item, this.inCart});

  final Item? item;
  final bool? inCart;


  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  // form for add item to cart
  final _formKey = GlobalKey<FormState>();

  String? _name;
  bool? _inCart;
  int? _count;
  double? _price;


  @override
  Widget build(BuildContext context) {
    if (widget.item != null) {
      _name ??= widget.item?.name;
      _inCart ??= widget.item?.inCart;
      _price ??= widget.item?.price;
      _count ??= widget.item?.count;
    } else if (widget.inCart != null) {
      _inCart ??= widget.inCart;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_name ?? 'Add item'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                if (widget.inCart != null) {
                  String category = _inCart! ? Api.cart : Api.list;
                  Api.addItem(category, Item(null, _name!, _inCart!, _price, _count));
                  Navigator.pop(context);
                } else {
                  Api.updateItem(Item(widget.item?.id, _name!, _inCart!, _price, _count));
                  Navigator.pop(context);
                }
              }
            },
          ),

          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              if (widget.item != null) {
                Api.deleteItem(widget.item!);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Article',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrer un nom';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  initialValue: _name,
                ),

                CustomRadioButton(
                  buttonLables: const ["Liste de courses", "Panier / Caddie"],
                  buttonValues: const [false, true],
                  radioButtonValue: (value) {
                    setState(() {
                      _inCart = value;
                    });},
                  defaultSelected: _inCart,

                  unSelectedColor: Theme.of(context).canvasColor,
                  selectedColor: Theme.of(context).primaryColor,
                  unSelectedBorderColor: Colors.grey,
                  selectedBorderColor: Theme.of(context).primaryColor,

                  enableButtonWrap: true,
                  enableShape: true,
                  width: 150,

                ),

                Column(
                  children: [
                    const Text('Quantité (optionnel)'),
                    NumberPicker(
                      minValue: 0,
                      maxValue: 100,
                      value: _count ?? 0,
                      onChanged: (value) {
                        setState(() {
                          _count = value;
                        });
                      },

                      axis: Axis.horizontal,
                      haptics: true,
                    ),
                  ],
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Prix (optionnel)',
                  ),
                  validator: (value) {
                    if (_inCart == true && (value == null || value.isEmpty)) {
                        return 'Entrer un prix';
                      }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _price = double.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  initialValue: _price?.toString(),
                  enabled: _inCart == true,
                ),

              ].map((widget) => Padding(
                padding: const EdgeInsets.all(16),
                child: widget,
              )).toList(),
            ),
          ),
          (_name != null && _inCart != null) ? ItemCard(item: Item(null, _name!, _inCart!, _price, _count)) : Container(),
        ],
      ),
    );
  }
}