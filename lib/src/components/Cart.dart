import 'package:ShoppingList/src/model/Item.dart';
import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/ItemCard.dart';
import 'package:ShoppingList/src/components/Confirmation.dart';

import 'package:ShoppingList/src/model/Api.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // get items from api
  var items = Api.fetchItems(Api.cart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              double totalPriceTemp = 0;
              for (int i = 0; i < snapshot.data!.length; i++) {
                totalPriceTemp += snapshot.data![i].price! * snapshot.data![i].count!;

              }
              return Text('Total: $totalPriceTemp');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment supprimer tous les éléments du panier ?').then((value) {
                if (value != null && value) {
                  setState(() {
                    Api.clearItems();
                    items = Api.fetchItems(Api.list);
                  });
                }
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
