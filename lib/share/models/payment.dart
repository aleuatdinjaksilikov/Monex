import 'package:uuid/uuid.dart';

class Payment {
  final String id;
  final String transactionId;
  final double amount;
  final String? note;
  final DateTime paidAt;

  const Payment({
    required this.id,
    required this.transactionId,
    required this.amount,
    this.note,
    required this.paidAt,
  });

  factory Payment.create({
    required String transactionId,
    required double amount,
    String? note,
  }) =>
      Payment(
        id: const Uuid().v4(),
        transactionId: transactionId,
        amount: amount,
        note: note,
        paidAt: DateTime.now(),
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json['id'] as String,
    transactionId: json['transaction_id'] as String,
    amount: (json['amount'] as num).toDouble(),
    note: json['note'] as String?,
    paidAt: DateTime.parse(json['paid_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'transaction_id': transactionId,
    'amount': amount,
    'note': note,
    'paid_at': paidAt.toIso8601String(),
  };
}