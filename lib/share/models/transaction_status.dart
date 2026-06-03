enum TransactionStatus {
  active,
  partiallyPaid,
  closed
}

extension TransactionStatusExt on TransactionStatus {
  String get value => switch (this) {
    TransactionStatus.active        => 'active',
    TransactionStatus.partiallyPaid => 'partially_paid',
    TransactionStatus.closed        => 'closed',
  };

  static TransactionStatus fromString(String s) => switch (s) {
    'active'         => TransactionStatus.active,
    'partially_paid' => TransactionStatus.partiallyPaid,
    'closed'         => TransactionStatus.closed,
    _                => throw ArgumentError('Unknown status: $s'),
  };
}