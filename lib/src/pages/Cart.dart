import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/ItemCard.dart';
import 'package:ShoppingList/src/pages/Settings.dart';

import 'package:ShoppingList/src/data/db.dart' as db;

import '../components/Confirmation.dart';
import 'ItemView.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // get items from api
  var items = db.getItems(db.cart);

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
              return Text('Prix total: $totalPriceTemp');
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
              showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment supprimer tous les éléments du panier ?', 'Annuler', 'Supprimer').then((value) async {
                if (value != null && value) {
                  if (!await db.deleteAllItems(db.cart)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur lors de la suppression des éléments du panier')));
                  } else {
                    setState(() {
                      items = db.getItems(db.cart);
                    });
                  }
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              ).then((value) {
                setState(() {
                  items = db.getItems(db.cart);
                });
              });
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            items = db.getItems(db.cart);
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
                    return ItemCard(
                      item: item,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ItemView(item: item)),
                        ).then((value) {
                          setState(() {
                            items = db.getItems(db.cart);
                          });
                        });
                      },
                    );
                  }
                  return null;
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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemView(
              inCart: true,
            )),
          ).then((value) {
            setState(() {
              items = db.getItems(db.cart);
            });
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
