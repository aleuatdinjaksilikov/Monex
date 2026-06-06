class DebtModel {
  final int id;
  final int debtorContactId;
  final String type;
  final double originalAmount;
  final int currencyCode;
  final String description;
  final String status;
  final DateTime createdAt;
  final DateTime closedAt;

  DebtModel({
    required this.id,
    required this.debtorContactId,
    required this.type,
    required this.originalAmount,
    required this.currencyCode,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.closedAt,
  });
}
