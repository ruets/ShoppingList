import 'package:flutter/material.dart';

import 'package:ShoppingList/src/model/Item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.item, required this.onTap}) : super(key: key);

  final Item item;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    if (!item.getInCart()) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  // deux décimales après la virgule
                  child: Text('${item.count ?? 0} x'),
                ),
              ),
            ),
            title: Text(item.name),
            trailing: const Icon(Icons.arrow_forward_ios),

            onTap: onTap,
          ),
        ),
      );
    } else {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  // deux décimales après la virgule
                  child: Text('${item.count} x'),
                ),
              ),
            ),
            title: Text(item.name),
            subtitle: Text(item.count != null ? 'Total: ${(item.price! * item.count!)}€' : 'Total: ${item.price}€'),
            trailing: Text('${item.price!.toStringAsFixed(2)}€'),

            onTap: onTap,
          ),
        ),
      );
    }
  }
}