import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ShoppingList/src/model/Item.dart';

class Api {
  static const String _url = 'https://shoppinglist-uwqi.onrender.com/api';

  static const String list = 'list';
  static const String cart = 'cart';

  static Future<List<Item>> fetchItems(String category) async {
    final response = await http.get(Uri.parse('${Api._url}/$category'));
    final data = jsonDecode(response.body) as List;

    return data.map((json) => Item.fromJson(json)).toList();
  }

  static Future<Item> addItem(String category, Item item) async {
    final response = await http.post(
      Uri.parse('${Api._url}/$category'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item.toJson()),
    );

    return Item.fromJson(jsonDecode(response.body));
  }

  static Future<Item> updateItem(Item item) async {
    final response = await http.put(
      Uri.parse('${Api._url}/${item.getId()}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(item.toJson()),
    );

    return Item.fromJson(jsonDecode(response.body));
  }

  static Future<void> deleteItem(Item item) async {
    await http.delete(Uri.parse('${Api._url}/${item.getId()}'));
  }
}