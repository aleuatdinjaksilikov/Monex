import 'package:flutter/material.dart';
import 'package:monex/features/contact_detail/active_debts/active_debts_item.dart';

class ActiveDebtsScreen extends StatelessWidget {
  const ActiveDebtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context,index)=>ActiveDebtsItem()
    );
  }
}