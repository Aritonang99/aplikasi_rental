import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/car_provider.dart';
import 'car_detail_screen.dart';

class CarListScreen extends StatefulWidget {
  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CarProvider>(context, listen: false).fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);
    final cars = carProvider.cars;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Mobil'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return ListTile(
            leading: Image.network(car.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(car.brand),
            subtitle: Text('${car.licensePlate} - ${car.color}'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarDetailScreen(car: car)));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic to add new car
        },
        child: Icon(Icons.add),
      ),
    );
  }
}