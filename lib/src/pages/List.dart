import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/ItemCard.dart';
import 'package:ShoppingList/src/components/Confirmation.dart';
import 'package:ShoppingList/src/pages/Settings.dart';

import 'package:ShoppingList/src/model/Api.dart';


class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  // get items from api
  var items = Api.fetchItems(Api.list);

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
            items = Api.fetchItems(Api.list);
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
