import 'package:flutter/material.dart';

import 'package:ShoppingList/src/model/Item.dart';

import 'package:ShoppingList/src/components/ItemView.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    if (!item.getInCart()) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  // deux décimales après la virgule
                  child: Text('${item.count ?? 0} x'),
                ),
              ),
            ),
            title: Text(item.name),
            trailing: Icon(Icons.arrow_forward_ios),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemView(item: item),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  // deux décimales après la virgule
                  child: Text('${item.count} x'),
                ),
              ),
            ),
            title: Text(item.name),
            subtitle: Text(item.count != null ? 'Total: ${(item.price! * item.count!)}€' : 'Total: ${item.price}€'),
            trailing: Text('${item.price!.toStringAsFixed(2)}€'),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemView(item: item),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}