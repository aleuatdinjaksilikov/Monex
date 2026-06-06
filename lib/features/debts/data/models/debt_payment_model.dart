class DebtPaymentModel {
  final int id;
  final int debtId;
  final double amount;
  final String note;
  final DateTime createdAt;

  DebtPaymentModel({
    required this.id,
    required this.debtId,
    required this.amount,
    required this.note,
    required this.createdAt,
  });
}
