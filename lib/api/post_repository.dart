import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_flutter/models/post_model.dart';
import 'package:flutter/material.dart';

class Api {
  static const String baseUrl = 'http://10.0.2.2:8000';

  static Future<List<Post>> getPosts(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/public/posts'));

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final List<dynamic> data = jsonBody['data']['data'];
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load posts. Status code: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    } 
    // Throw an exception if an error condition is met
  }
}
