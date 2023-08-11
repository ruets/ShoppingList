import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:ShoppingList/src/model/Item.dart';

const String list = 'list';
const String cart = 'cart';

Database? database;

Future<bool> init() async {
  const String _databaseName = 'database.db';
  const int _databaseVersion = 1;

  WidgetsFlutterBinding.ensureInitialized();
  
  database = await openDatabase(
    join(await getDatabasesPath(), _databaseName),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE IF NOT EXISTS 'items' ("
            "  '_id' INTEGER PRIMARY KEY AUTOINCREMENT,"
            "  'name' TEXT NOT NULL UNIQUE,"
            "  'inCart' BOOLEAN NOT NULL,"
            "  'price' REAL,"
            "  'count' INTEGER"
            ")",
      );

      // return db.execute(
      //   "CREATE TABLE IF NOT EXISTS 'settings' ("
      //   "  'name' TEXT PRIMARY KEY,"
      //   "  'value' TEXT"
      //   ")",
      // );
    },
    version: _databaseVersion,
  );

  return true;
}

Future<bool> insertItem(Item item) async {
  if (database == null) {
    throw Exception('Database not initialized');
  }

  final db = await database;
  try {
    await db?.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
    return true;
  } catch (e) {
    return false;
  }
}

Future<List<Item>> getItems(String category) async {
  if (database == null) {
    throw Exception('Database not initialized');
  }

  final db = await database;
  final categoryBool = category == cart;
  final List<Map<String, dynamic>>? maps = await db?.query('items', where: "inCart = ?", whereArgs: [categoryBool]);

  return List.generate(maps!.length, (i) {
    return Item(
      maps[i]['_id'],
      maps[i]['name'],
      maps[i]['inCart'] == 1,
      maps[i]['price'],
      maps[i]['count'],
    );
  });
}

Future<Item> getItem(int id) async {
  if (database == null) {
    throw Exception('Database not initialized');
  }

  final db = await database;
  final List<Map<String, dynamic>>? maps = await db?.query('items', where: "_id = ?", whereArgs: [id]);

  return Item(
    maps![0]['_id'],
    maps[0]['name'],
    maps[0]['inCart'] == 1,
    maps[0]['price'],
    maps[0]['count'],
  );
}

Future<bool> updateItem(Item item) async {
  if (database == null) {
    throw Exception('Database not initialized');
  }

  final db = await database;
  try {
    await db?.update(
      'items',
      item.toMap(),
      where: "_id = ?",
      whereArgs: [item.getId()],
    );
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> deleteItem(int id) async {
  if (database == null) {
    throw Exception('Database not initialized');
  }

  final db = await database;
  try {
    await db?.delete(
      'items',
      where: "_id = ?",
      whereArgs: [id],
    );
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> deleteAllItems(String? category) async {
  if (database == null) {
    throw Exception('Database not initialized');
  }

  final db = await database;

  if (category == null) {
    try {
      await db?.delete('items');
      return true;
    } catch (e) {
      return false;
    }
  } else {
    try {
      await db?.delete('items', where: "inCart = ?", whereArgs: [category == cart]);
      return true;
    } catch (e) {
      return false;
    }
  }
}