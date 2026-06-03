
class Currency {
  final String id;
  final String code;   // e.g. "UZS", "USD"
  final String symbol; // e.g. "сум", "$"

  const Currency({
    required this.id,
    required this.code,
    required this.symbol,
  });

  static const Currency uzs = Currency(
    id: 'uzs',
    code: 'UZS',
    symbol: 'сум',
  );

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json['id'] as String,
    code: json['code'] as String,
    symbol: json['symbol'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'code': code,
    'symbol': symbol,
  };
}