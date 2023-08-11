import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:ShoppingList/src/model/Item.dart';

void SaveToFile(List<Item> list, List<Item> cart) async {
  String json = '{\n';

  json += '"list": [\n';
  for (int i = 0; i < list.length; i++) {
    json += list[i].toString();
    if (i < list.length - 1) {
      json += ',';
    }
    json += '\n';
  }
  json += '],\n';

  json += '"cart": [\n';
  for (int i = 0; i < cart.length; i++) {
    json += cart[i].toString();
    if (i < cart.length - 1) {
      json += ',';
    }
    json += '\n';
  }
  json += '],\n';

  json += '}';

  File file = File('${(await getTemporaryDirectory()).path}/items.json');
  await file.writeAsString(json);

  await Share.shareFiles(['${(await getTemporaryDirectory()).path}/items.json']);
}