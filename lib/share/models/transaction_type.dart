// lent     = я дал деньги → мне должны → зелёный
// borrowed = я взял деньги → я должен  → красный
enum TransactionType{
  lent,
  borrowed
}

extension TransactionTypeExt on TransactionType {
  String get value => switch (this) {
    TransactionType.lent     => 'lent',
    TransactionType.borrowed => 'borrowed',
  };

  static TransactionType fromString(String s) => switch (s) {
    'lent'     => TransactionType.lent,
    'borrowed' => TransactionType.borrowed,
    _          => throw ArgumentError('Unknown type: $s'),
  };
}