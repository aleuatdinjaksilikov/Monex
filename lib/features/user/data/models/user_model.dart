class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final int currencyCode;
  final int languageCode;
  final DateTime createdAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.currencyCode,
    required this.languageCode,
    required this.createdAt,
  });
}
