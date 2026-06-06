import 'package:flutter/material.dart';
import 'package:monex/features/contact/presentation/contact_detail/closed_debts/closed_debts_item.dart';

class ClosedDebtsScreen extends StatelessWidget {
  const ClosedDebtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.zero,
      itemBuilder: (context,index) => ClosedDebtsItem()
    );
  }
}