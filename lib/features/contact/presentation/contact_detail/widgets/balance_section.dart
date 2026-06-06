import 'package:flutter/material.dart';
import 'package:monex/core/utils/currency_format_ext.dart';
import 'package:monex/core/widgets/app_button.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Text("ТЕКУЩИЙ ДОЛГ", style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Text(
              153000.toCurrency(symbol: "UZS"),
              style: TextStyle(fontSize: 24, fontWeight: .bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .center,
              children: [
                Expanded(
                  child: AppButton(
                    onTap: () {},
                    bacgroundColor: Colors.green.withValues(alpha: 0.4),
                    height: 48,
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: 5),
                      Text("Позвонить"),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: AppButton(
                    withBorder: true,
                    height: 48,
                    onTap: () {},
                    bacgroundColor: Colors.white12,
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(width: 5),
                      Text("Напомнить"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
