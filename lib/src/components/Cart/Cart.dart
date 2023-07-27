import 'package:flutter/material.dart';

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
                    return ListTile(
                      title:
                      Row(
                        children: [
                          if (item.count != null)
                            Text('${item.count}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(' ${item.name}'),
                        ],
                      ),
                      leading: const Icon(Icons.check_box_outlined),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      shape: const Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),

                      onTap: () {
                        Navigator.pushNamed(context, '/item', arguments: item); // TODO: add moveItemToList page
                      },
                    );
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
