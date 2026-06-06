class ContactModel {
  final int id;
  final String firstName;
  final String lastName;
  final String firstPhone;
  final String secondPhone;
  final String adress;
  final DateTime createdAt;

  ContactModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.firstPhone,
    required this.secondPhone,
    required this.adress,
    required this.createdAt,
  });
}
