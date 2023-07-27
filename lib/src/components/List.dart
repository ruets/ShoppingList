import 'package:flutter/material.dart';

import 'package:ShoppingList/src/model/Api.dart';

void main() {
  runApp(const List());
}

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
                      return ListTile(
                        title:
                            Row(
                              children: [
                                if (item.count != null)
                                  Text('${item.count}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(' ${item.name}'),
                              ],
                            ),
                        leading: const Icon(Icons.check_box_outline_blank),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        shape: const Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),

                        onTap: () {
                          Navigator.pushNamed(context, '/item', arguments: item); // TODO: add moveItemToCart page
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
