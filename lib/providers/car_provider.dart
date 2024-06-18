import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/car.dart';

class CarProvider with ChangeNotifier {
  List<Car> _cars = [];
  final String _baseUrl = 'https://666e89ddf1e1da2be5208065.mockapi.io';

  List<Car> get cars => _cars;

  Future<void> fetchCars() async {
    final url = Uri.parse('$_baseUrl/mobil');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _cars = data.map((json) => Car.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<void> addCar(Car car) async {
    final url = Uri.parse('$_baseUrl/mobil');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(car.toJson()),
    );
    if (response.statusCode == 201) {
      _cars.add(Car.fromJson(json.decode(response.body)));
      notifyListeners();
    } else {
      throw Exception('Failed to add car');
    }
  }

  Future<void> updateCar(Car car) async {
    final url = Uri.parse('$_baseUrl/mobil/${car.id}');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(car.toJson()),
    );
    if (response.statusCode == 200) {
      final index = _cars.indexWhere((c) => c.id == car.id);
      if (index != -1) {
        _cars[index] = car;
        notifyListeners();
      }
    } else {
      throw Exception('Failed to update car');
    }
  }

  Future<void> deleteCar(String id) async {
    final url = Uri.parse('$_baseUrl/mobil/$id');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      _cars.removeWhere((car) => car.id == id);
      notifyListeners();
    } else {
      throw Exception('Failed to delete car');
    }
  }
}