import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/car.dart';
import '../providers/car_provider.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  CarDetailScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(car.brand),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(car.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(car.licensePlate),
            Text(car.color),
            Text('${car.year}'),
            Text(car.status),
            Text('Rp. ${car.price}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic to update car
                  },
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await carProvider.deleteCar(car.id);
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}