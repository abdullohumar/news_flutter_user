import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_flutter/models/categories_model.dart';

class CategoryRepository {
  static Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('http:// 192.168.241.1:8000/api/public/categories'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final categories = (jsonData['data']['data'] as List)
           .map((categoryJson) => CategoryModel.fromJson(categoryJson))
           .toList();

        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      rethrow;
    }
  }
}