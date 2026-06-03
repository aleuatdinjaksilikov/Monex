extension CurrencyFormatExtension on num {
  String toCurrency({String symbol = "сум"}) {
    final parts = toStringAsFixed(2).split('.');

    final integerPart = parts[0];
    final decimalPart = parts[1];

    final buffer = StringBuffer();
    int counter = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      buffer.write(integerPart[i]);
      counter++;

      if (counter % 3 == 0 && i != 0) {
        buffer.write(' ');
      }
    }

    final formattedInteger =
        buffer.toString().split('').reversed.join();

  
    if (decimalPart == "00") {
      return "$formattedInteger $symbol";
    }

    return "$formattedInteger.$decimalPart $symbol";
  }
}