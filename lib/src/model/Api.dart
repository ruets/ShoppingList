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
}