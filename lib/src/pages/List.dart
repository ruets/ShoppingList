import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/ItemCard.dart';
import 'package:ShoppingList/src/pages/Settings.dart';

import 'package:ShoppingList/src/data/db.dart' as db;

import '../components/Confirmation.dart';


class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  // get items from api
  var items = db.getItems(db.list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Nombre total d\'articles : ${snapshot.data?.length}');
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
              showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment supprimer tous les éléments de la liste ?', 'Annuler', 'Supprimer').then((value) {
                if (value != null && value) {
                  db.deleteAllItems(db.list);
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
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            items = db.getItems(db.list);
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
    );
  }
}
