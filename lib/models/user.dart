class User {
  final String id;
  final String name;
  final String username;
  final String password;
  final String email;

  User({required this.id, required this.name, required this.username, required this.password, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'email': email,
    };
  }
}