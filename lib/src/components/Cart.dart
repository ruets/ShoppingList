import 'package:ShoppingList/src/model/Item.dart';
import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/ItemCard.dart';

import 'package:ShoppingList/src/model/Api.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // get items from api
  var items = Api.fetchItems(Api.cart);
  var totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total: ${totalPrice.toStringAsFixed(2)}€'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                items = Api.clearItems();
              });
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            items = Api.fetchItems(Api.cart);
          });
        },

        child: FutureBuilder(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data?[index];

                  if (item != null) {
                    totalPrice += (item.count != null ? (item.price! * item.count!) : item.price)!;

                    return ItemCard(item: item);
                  }
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
