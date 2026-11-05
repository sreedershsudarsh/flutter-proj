import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Server error: ${response.statusCode}');
    }

    final data = jsonDecode(response.body);

    final List productsJson = data['products'];

    return productsJson.map((item) => ProductModel.fromJson(item)).toList();
  }
}