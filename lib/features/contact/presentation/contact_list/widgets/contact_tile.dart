import 'package:flutter/material.dart';
import 'package:monex/share/models/transaction.dart';
import 'package:monex/share/models/transaction_status.dart';
import 'package:monex/share/models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;
  final List<Transaction> transactions;
  final VoidCallback? onTap;

  const ContactTile({super.key, required this.contact, required this.transactions, this.onTap});

  List<Transaction> get _active => transactions
      .where((t)=> t.status != TransactionStatus.closed).toList();

  String get _initials {
    final parts = contact.name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return contact.name.substring(0, contact.name.length.clamp(0, 2)).toUpperCase();
  }

  String get _debtLabel {
    final count = _active.length;
    if (count == 0) return 'Долгов нет';
    final mod10 = count % 10;
    final mod100 = count % 100;
    if (mod100 >= 11 && mod100 <= 14) return '$count долгов';
    if (mod10 == 1) return '$count долг';
    if (mod10 >= 2 && mod10 <= 4) return '$count долга';
    return '$count долгов';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
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
                    Text(contact.name, style: TextStyle(fontSize: 18,color: Color(0xFF5F5E5A),fontWeight: .w500),),
                    const SizedBox(height: 2,),
                    Text(_debtLabel,style: TextStyle(fontSize: 16,color: Color(0xFF5F5E5A),fontWeight: .w800),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
