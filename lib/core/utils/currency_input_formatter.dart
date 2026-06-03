import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // разрешаем только цифры и точку
    text = text.replaceAll(RegExp(r'[^0-9.]'), '');

    if (text.isEmpty) {
      return const TextEditingValue();
    }

    // разделяем целую и дробную часть
    final parts = text.split('.');

    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // форматируем тысячи
    integerPart = _formatThousands(integerPart);

    // ограничим копейки до 2 знаков
    if (decimalPart.length > 2) {
      decimalPart = decimalPart.substring(0, 2);
    }

    final formatted = decimalPart.isNotEmpty
        ? '$integerPart.$decimalPart'
        : integerPart;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatThousands(String value) {
    final buffer = StringBuffer();
    int count = 0;

    for (int i = value.length - 1; i >= 0; i--) {
      buffer.write(value[i]);
      count++;

      if (count % 3 == 0 && i != 0) {
        buffer.write(',');
      }
    }

    return buffer.toString().split('').reversed.join();
  }
}