import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final String _baseUrl = 'https://666e89ddf1e1da2be5208065.mockapi.io';

  User? get user => _user;

  Future<void> register(User user) async {
    final url = Uri.parse('$_baseUrl/user');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      _user = User.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<void> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl/user?username=$username&password=$password');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        _user = User.fromJson(data[0]);
        notifyListeners();
      } else {
        throw Exception('User not found');
      }
    } else {
      throw Exception('Failed to login');
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}