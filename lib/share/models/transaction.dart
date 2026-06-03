import 'package:monex/share/models/transaction_status.dart';
import 'package:monex/share/models/transaction_type.dart';
import 'package:uuid/uuid.dart';

class Transaction {
  final String id;
  final String contactId;
  final TransactionType type;
  final double amount;      // original amount
  final double remaining;   // amount left to pay
  final String currencyId;
  final String? description;
  final TransactionStatus status;
  final DateTime createdAt;

  const Transaction({
    required this.id,
    required this.contactId,
    required this.type,
    required this.amount,
    required this.remaining,
    required this.currencyId,
    this.description,
    required this.status,
    required this.createdAt,
  });

  factory Transaction.create({
    required String contactId,
    required TransactionType type,
    required double amount,
    required String currencyId,
    String? description,
  }) =>
      Transaction(
        id: const Uuid().v4(),
        contactId: contactId,
        type: type,
        amount: amount,
        remaining: amount,
        currencyId: currencyId,
        description: description,
        status: TransactionStatus.active,
        createdAt: DateTime.now(),
      );

  Transaction applyPayment(double paymentAmount) {
    assert(paymentAmount > 0, 'Payment amount must be positive');
    assert(paymentAmount <= remaining, 'Payment exceeds remaining balance');

    final newRemaining = (remaining - paymentAmount).clamp(0.0, amount);
    final newStatus = newRemaining == 0
        ? TransactionStatus.closed
        : TransactionStatus.partiallyPaid;
    return copyWith(remaining: newRemaining, status: newStatus);
  }

  Transaction copyWith({
    String? contactId,
    TransactionType? type,
    double? amount,
    double? remaining,
    String? currencyId,
    String? description,
    TransactionStatus? status,
  }) =>
      Transaction(
        id: id,
        contactId: contactId ?? this.contactId,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        remaining: remaining ?? this.remaining,
        currencyId: currencyId ?? this.currencyId,
        description: description ?? this.description,
        status: status ?? this.status,
        createdAt: createdAt,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'] as String,
    contactId: json['contact_id'] as String,
    type: TransactionTypeExt.fromString(json['type'] as String),
    amount: (json['amount'] as num).toDouble(),
    remaining: (json['remaining'] as num).toDouble(),
    currencyId: json['currency_id'] as String,
    description: json['description'] as String?,
    status: TransactionStatusExt.fromString(json['status'] as String),
    createdAt: DateTime.parse(json['created_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'contact_id': contactId,
    'type': type.value,
    'amount': amount,
    'remaining': remaining,
    'currency_id': currencyId,
    'description': description,
    'status': status.value,
    'created_at': createdAt.toIso8601String(),
  };

  
}