import 'package:flutter/material.dart';

class RecentTransactionSection extends StatelessWidget {
  final VoidCallback onSeeAll;

  const RecentTransactionSection({super.key, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        SizedBox(height: 15,),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              // return TransactionTile(contacts: ,transaction: ,);
            },
            separatorBuilder: (context, index){
              return Divider(height: 0.3,color: Color(0xffcccaca),indent: 5,endIndent: 5,);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Последние транзакции',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(
            'Посмотреть все',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
