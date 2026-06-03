import 'package:flutter/material.dart';
import 'package:monex/core/constants/app_decorations.dart';
import 'package:monex/features/home/utils/debt_type.dart';
import 'package:monex/features/home/utils/debt_type_ext.dart';

class BalanceDashboard extends StatelessWidget {
  final double totalLend;
  final double totalBorrowed;
  const BalanceDashboard({super.key, required this.totalLend, required this.totalBorrowed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _BalanceCard(
            balance: 10000000,
            type: DebtType.iOwe,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _BalanceCard(
            balance: 100000,
            type: DebtType.owedToMe,
          ),
        ),
      ],
    );
  }
}


class _BalanceCard extends StatefulWidget {
  final double balance;
  final DebtType type;

  const _BalanceCard({required this.balance, required this.type});

  @override
  State<_BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<_BalanceCard> {
  String _formatBalance(double amount) {
    final formatted = amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]} ',
    );
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: cardDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(widget.type.label,style: TextStyle(fontWeight: .bold),),
            SizedBox(height: 10,),
            Text(_formatBalance(widget.balance), style: TextStyle(color: widget.type.color,fontSize: 20,fontWeight: .bold),)
          ],
        ),
      ),
    );
  }
}
