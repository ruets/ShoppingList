import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:ShoppingList/src/model/Item.dart';
import 'package:ShoppingList/src/data/db.dart' as db;

Future<bool> saveToFile() async {
  try {
    List<Item> items = await db.getItems(null);

    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < items.length; i++) {
      data.add(items[i].toMap());
    }

    String json = jsonEncode(data);

    File file = File('${(await getTemporaryDirectory()).path}/items.json');
    await file.writeAsString(json);

    await Share.shareFiles(['${(await getTemporaryDirectory()).path}/items.json']);

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> readFromFile() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String json = await file.readAsString();

      final data = jsonDecode(json) as List;

      if (db.deleteAllItems(null) == false) {
        return false;
      }

      for (int i = 0; i < data.length; i++) {
        db.insertItem(Item.fromJson(data[i]));
      }

      DefaultCacheManager().emptyCache();
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}