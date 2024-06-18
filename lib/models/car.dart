class Car {
  final String id;
  final String brand;
  final String licensePlate;
  final String color;
  final int year;
  final String status;
  final double price;
  final String imageUrl;

  Car({
    required this.id,
    required this.brand,
    required this.licensePlate,
    required this.color,
    required this.year,
    required this.status,
    required this.price,
    required this.imageUrl,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      brand: json['brand'],
      licensePlate: json['licensePlate'],
      color: json['color'],
      year: json['year'],
      status: json['status'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'licensePlate': licensePlate,
      'color': color,
      'year': year,
      'status': status,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}