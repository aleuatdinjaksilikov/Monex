import 'package:flutter/material.dart';
import 'package:monex/share/models/transaction.dart';
import 'package:monex/share/models/transaction_type.dart';
import 'package:monex/share/models/contact.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final Map<String, Contact> contacts;
  const TransactionTile({super.key, required this.transaction, required this.contacts});

  bool get _iLent => transaction.type == TransactionType.lent;

  Contact? get _user => contacts[transaction.contactId];

  String get _initials {
    final name = _user?.name ?? 'Unknown name';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  String get _formattedDate {
    const months = [
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек',
    ];
    final d = transaction.createdAt;
    return '${d.day} ${months[d.month - 1]}';
  }

  String get _formattedAmount {
    final sign = _iLent ? '+' : '-';
    final value = transaction.remaining
        .toStringAsFixed(0)
        .replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (_) => ' ',
    );
    return '$sign$value';
  }

  Color get _amountColor => _iLent ? const Color(0xFF1D9E75) : const Color(0xFFD85A30);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xff717182),
              child: Text(_initials,style: const TextStyle(fontSize: 14,fontWeight: .w500,color: Color(0xFFFFFFFF)),),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(_user?.name ?? 'Неизвестный', style: TextStyle(fontSize: 18,color: Color(0xFF5F5E5A),fontWeight: .w500),),
                  const SizedBox(height: 2,),
                  Text(_formattedDate,style: TextStyle(fontSize: 16,color: Color(0xFF5F5E5A),fontWeight: .w800),)
                ],
              ),
            ),
            const SizedBox(width: 8,),
            Text(_formattedAmount,style: TextStyle(fontSize: 22 ,color: _amountColor,fontWeight: .bold),)
          ],
        ),
      ),
    );
  }
}
