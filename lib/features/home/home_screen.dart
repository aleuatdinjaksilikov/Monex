import 'package:flutter/material.dart';
import 'package:monex/features/home/widgets/action_buttons.dart';
import 'package:monex/features/home/widgets/balance_card.dart';
import 'package:monex/share/fake_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _homeAppBar(),

          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(delegate: SliverChildListDelegate([
              BalanceDashboard(
                totalBorrowed: FakeData.totalBorrowed,
                totalLend: FakeData.totalLent,
              ),
              const SizedBox(height: 12),
              ActionButtons(),
              const SizedBox(height: 20),
              // RecentTransactionSection(onSeeAll: () {
              //
              // })

            ])
            )
            ,)
        ],
      ),
    );
  }

  SliverAppBar _homeAppBar(){
    return SliverAppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      pinned: true,
      centerTitle: false,
      title:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'С возвращением',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8A8A8A),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '...',
            overflow: .ellipsis,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
      ],
    );
  }
}
