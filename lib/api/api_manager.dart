import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_flutter/models/user_model.dart';
import 'package:sp_util/sp_util.dart';

class ApiManager {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<UserModel> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: json.encode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['success']) {
          // Menyimpan user dan token ke SharedPreferences
          SpUtil.putString('user', json.encode(jsonResponse['user']));
          SpUtil.putString('email', json.encode(jsonResponse['email']));
          SpUtil.putString('token', jsonResponse['token']);

          // Mengembalikan objek UserModel
          return UserModel.fromJson(jsonResponse['user']);
        } else {
          throw Exception('Login failed: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to login with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<UserModel> getUserDetails() async {
    try {
      // Mendapatkan data user dari SharedPreferences
      String? userJson = SpUtil.getString('user');
      if (userJson != null) {
        // Mengubah data user dari JSON string menjadi objek UserModel
        Map<String, dynamic> userMap = json.decode(userJson);
        return UserModel.fromJson(userMap);
      } else {
        throw Exception('No user data found');
      }
    } catch (e) {
      throw Exception('Failed to get user details: $e');
    }
  }

  static Future<void> logout() async {
    try {
      // Menghapus data user dan token dari SharedPreferences
      await SpUtil.remove('user');
      await SpUtil.remove('token');
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}
