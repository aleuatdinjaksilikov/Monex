
import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  final String? phone;
  final String? email;
  final DateTime createdAt;

  const Contact({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    required this.createdAt,
  });

  factory Contact.create({
    required String name,
    String? phone,
    String? email,
  }) =>
      Contact(
        id: const Uuid().v4(),
        name: name,
        phone: phone,
        email: email,
        createdAt: DateTime.now(),
      );


  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json['id'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'created_at': createdAt.toIso8601String(),
  };
}